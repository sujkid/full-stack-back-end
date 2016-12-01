# User Item model
class UserItem < ActiveRecord::Base
  belongs_to :user
  has_many :requests
end
