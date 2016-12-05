class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_item
end
