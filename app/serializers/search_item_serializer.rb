class SearchItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id, :user_name, :status
end
