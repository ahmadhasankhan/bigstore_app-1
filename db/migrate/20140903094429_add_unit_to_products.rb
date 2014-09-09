class AddUnitToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :unit, :string, :default => 'NA'
  end
end
