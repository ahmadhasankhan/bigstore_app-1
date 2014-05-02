class AddDefaultTenantValueToAll < ActiveRecord::Migration
  def change
    tables = ActiveRecord::Base.connection.tables - ["schema_migrations", "tenants"]
    tables.each do |table|
      change_column table, :tenant_id, :integer, default: 1
    end
  end
end
