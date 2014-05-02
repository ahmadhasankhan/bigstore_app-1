Spree::Base.class_eval do
  # default_scope -> { where("#{current_table_name}.tenant_id".to_sym => Tenant.current_id) if Tenant.current_id }

  # def self.default_scope(lam)
  #  where(tenant_id: Tenant.current_id) if Tenant.current_id
  # end
end
