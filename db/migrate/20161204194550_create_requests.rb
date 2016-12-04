class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :mailing_address
      t.date :return_date

      t.timestamps null: false
    end
  end
end
