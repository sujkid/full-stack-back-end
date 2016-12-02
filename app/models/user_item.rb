# User Item model
class UserItem < ActiveRecord::Base
  belongs_to :user
  has_many :requests

  has_many :borrows, :class_name => 'Request', :foreign_key => 'borrowed_user_item_id'
  has_many :lends, :class_name => 'Request', :foreign_key => 'lent_user_item_id'
end
