Spree::User.class_eval do
  default_scope -> { where(tenant_id: Tenant.current_id) if Tenant.current_id }
end