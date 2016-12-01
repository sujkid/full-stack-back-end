# User Item serializer
class UserItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id, :status
end
