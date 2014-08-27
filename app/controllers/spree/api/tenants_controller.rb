module Spree
  module Api
    class TenantsController < ActionController::Base
      before_filter :set_tenant, only: [:show]
      respond_to :json
     
      def new
        @tenant = Tenant.new
      end

      # First check if the user is present using find_by_email
      def create
        @tenant = Tenant.new(tenant_params)
        user = Spree::User.find_by_email(params[:user][:email])
        if !user.present?  # If user not exist in database create the user
          if @tenant.save
            @tenant = Tenant.create_store_tenant(@tenant.id, params[:user][:email], params[:user][:password])
            redirect_to admin_path, :status => 201
          else 
            @resource = @tenant
            render "spree/api/errors/invalid_resource", :status => 422
          end
        else # If user with email already exist in database
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