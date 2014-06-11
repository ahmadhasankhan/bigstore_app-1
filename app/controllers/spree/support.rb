module CurrentTenant
  
  def current_tenant
    if request.subdomain == "venky" || request.subdomain == "dhoni"
      Tenant.find_by_subdomain! request.subdomain
    else
      redirect_to 'http://venky.roroid.asia'
    end
  end

  private
    def scope_current_tenant
      Tenant.current_id = current_tenant.id if current_tenant
      yield
    ensure
      Tenant.current_id = nil
    end
end
