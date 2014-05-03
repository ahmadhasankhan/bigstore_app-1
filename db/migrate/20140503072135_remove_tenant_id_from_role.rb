class RemoveTenantIdFromRole < ActiveRecord::Migration
  def change
    remove_column :spree_roles, :tenant_id
  end
end
