# the User Items table
class CreateUserItems < ActiveRecord::Migration
  def change
    create_table :user_items do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
