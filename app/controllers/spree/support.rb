module CurrentTenant
  
  def current_tenant
    # if spree_current_user.present?

    # end
    # debugger
    Tenant.find_by_subdomain(request.subdomain)
  end

  private
    def scope_current_tenant
      
      #Tenant.current_id = Tenant.first.id
      Tenant.current_id = current_tenant.id if current_tenant
      yield
    ensure
      Tenant.current_id = nil
    end
end
