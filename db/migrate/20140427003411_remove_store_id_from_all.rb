class RemoveStoreIdFromAll < ActiveRecord::Migration
  def change
    tables = ActiveRecord::Base.connection.tables - ["schema_migrations"]
    tables.each do |table|
      remove_column table, :store_id, :integer
    end
  end
end
