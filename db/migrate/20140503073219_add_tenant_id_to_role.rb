class AddTenantIdToRole < ActiveRecord::Migration
  def change
    add_column :spree_roles, :tenant_id, :integer
  end
end
