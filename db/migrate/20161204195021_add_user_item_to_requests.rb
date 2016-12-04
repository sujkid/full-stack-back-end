class AddUserItemToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :user_item, index: true, foreign_key: true
  end
end
