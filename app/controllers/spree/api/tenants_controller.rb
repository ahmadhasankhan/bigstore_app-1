module Spree
  module Api
    class TenantsController < ActionController::Base
      before_filter :set_tenant, only: [:show]
      #espond_to :json

      def index
        @tenant = Tenant.all
      end


      def new
        @tenant = Tenant.new
      end

      def create
        @tenant = Tenant.new(tenant_params)
        if @tenant.save
          @tenant = Tenant.create_store_tenant(params[:user][:email], params[:user][:password])
          redirect_to admin_path, :status => 201
        else 
          @resource = @tenant
          render "spree/api/errors/invalid_resource", :status => 422
        end
      end

      private
      ########

      def set_tenant
        @tenant = Tenant.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def tenant_params
        params.require(:tenant).permit(:name, :subdomain, :domain, users: [:id , :email, :password])
      end
    end
  end
end