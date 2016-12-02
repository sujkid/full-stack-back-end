class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :location
      t.integer :duration
      t.integer :borrowed_user_item_id
      t.integer :lent_user_item_id

      t.timestamps null: false
    end
  end
end
