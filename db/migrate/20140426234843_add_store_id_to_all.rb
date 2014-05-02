class AddStoreIdToAll < ActiveRecord::Migration
  def change
    remove_column :spree_products, :store_id, :integer
    tables = ActiveRecord::Base.connection.tables - ["schema_migrations"]
    tables.each do |table|
      add_column table, :store_id, :integer, default: 1
    end
  end
end
