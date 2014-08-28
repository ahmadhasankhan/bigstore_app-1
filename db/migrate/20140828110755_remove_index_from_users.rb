class RemoveIndexFromUsers < ActiveRecord::Migration
  def change
    remove_index "spree_users", :name => "email_idx_unique"
  end
end
