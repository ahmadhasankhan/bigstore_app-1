Spree::Product.class_eval do
  default_scope -> { where(tenant_id: Tenant.current_id) if Tenant.current_id }
  
  UNIT_TYPES = ["Piece", "Kg", "Lt", "Meter"]
  #validates :unit, inclusion: UNIT_TYPES
end
