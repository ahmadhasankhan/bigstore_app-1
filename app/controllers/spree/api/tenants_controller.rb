module Spree
  module Api
    class TenantsController < ActionController::Base
      before_filter :set_tenant, only: [:show]
      respond_to :json
     
      def new
        @tenant = Tenant.new
      end

      # POST /tenants
      # POST /tenants.json
      def create
        @tenant = Tenant.new(tenant_params)
        if @tenant.save
          @tenant = Tenant.create_store_tenant(@tenant.id, params[:user][:email], params[:user][:password])
          redirect_to admin_path, :status => 201
          # respond_with(@tenant, :status => 201, :default_template => 'spree/api/tenants/show')
        else
          @resource = @tenant
          render "spree/api/errors/invalid_resource", :status => 422
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
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