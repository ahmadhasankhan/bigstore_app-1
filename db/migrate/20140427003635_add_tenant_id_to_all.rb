class AddTenantIdToAll < ActiveRecord::Migration
  def change
    tables = ActiveRecord::Base.connection.tables - ["schema_migrations"]
    tables.each do |table|
      add_column table, :tenant_id, :integer
    end
  end
end
