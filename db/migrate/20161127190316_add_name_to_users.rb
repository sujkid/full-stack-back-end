# Adding a new column to the users table
class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
  end
end
