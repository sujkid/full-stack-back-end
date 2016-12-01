class AddStatusToUserItems < ActiveRecord::Migration
  def change
    add_column :user_items, :status, :string
  end
end
