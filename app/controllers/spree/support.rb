module CurrentTenant
  
  def current_tenant
    Tenant.find_by_subdomain(request.subdomain) || Tenant.find_by_domain(request.domain)
  end

  private
    def scope_current_tenant
      Tenant.current_id = current_tenant.id if current_tenant
      yield
    ensure
      Tenant.current_id = nil
    end
end
