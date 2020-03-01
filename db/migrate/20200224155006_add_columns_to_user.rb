class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :coins, :integer
    add_column :users, :item1, :integer
    add_column :users, :item2, :integer
    add_column :users, :item3, :integer
    add_column :users, :item4, :integer
    add_column :users, :item5, :integer
  end
end
