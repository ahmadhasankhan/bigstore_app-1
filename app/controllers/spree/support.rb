module CurrentTenant
  
  def current_tenant
    zoho = "https://mail.zoho.com"
    if request.subdomain.eql?("venky") || request.subdomain.eql?("dhoni")
      Tenant.find_by_subdomain! request.subdomain
    elsif request.subdomain.eql?("mail")
      redirect_to zoho
    else
      redirect_to 'http://venky.roroid.asia'
      return
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
