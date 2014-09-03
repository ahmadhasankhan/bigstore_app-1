Spree::Product.class_eval do
  default_scope -> { where(tenant_id: Tenant.current_id) if Tenant.current_id }
  
  UNIT_TYPES = ["Pc", "Kg", "Lt", "Meter"]
  #validates :unit, inclusion: UNIT_TYPES

end
