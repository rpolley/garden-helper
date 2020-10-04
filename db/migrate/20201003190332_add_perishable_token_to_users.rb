class AddPerishableTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :perishable_token, :string
  end
end
