class Request < ActiveRecord::Base
  belongs_to :borrowed_user_item, :class_name => 'UserItem',
             :foreign_key => 'borrowed_user_item_id'
  belongs_to :lent_user_item, :class_name => 'UserItem',
             :foreign_key => 'lent_user_item_id'
end
