module CurrentTenant
  
  def current_tenant
    Tenant.find_by_subdomain! request.subdomain
  end

  private
    def scope_current_tenant
      Tenant.current_id = current_tenant.id
      yield
    ensure
      Tenant.current_id = nil
    end
end
