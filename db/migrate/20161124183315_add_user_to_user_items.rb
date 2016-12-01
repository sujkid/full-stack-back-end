# Add a foreign key to the User Items table
class AddUserToUserItems < ActiveRecord::Migration
  def change
    add_reference :user_items, :user, index: true, foreign_key: true
  end
end
