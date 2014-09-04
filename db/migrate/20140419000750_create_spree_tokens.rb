class CreateSpreeTokens < ActiveRecord::Migration
  def change
    create_table :spree_tokens do |t|
      t.string  :token_value, :null => false, :default => ""
      t.timestamps
    end
  end
end
