class AddTenantIdValueToAll < ActiveRecord::Migration
  def change
    tables = ActiveRecord::Base.connection.tables - ["spree_shipping_methods_zones","spree_roles_users","schema_migrations", "tenants", "spree_option_types_prototypes", "spree_option_values_variants", "spree_orders_promotions", "spree_products_promotion_rules", "spree_products_taxons", "spree_promotion_rules_users", "spree_properties_prototypes"]
    tables.each do |table|
      table.gsub("_", "/").classify.constantize.update_all(tenant_id: 2)
    end
  end
end
