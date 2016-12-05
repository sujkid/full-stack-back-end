class RequestSerializer < ActiveModel::Serializer
  attributes :id, :user_item_id, :mailing_address, :return_date, :user_id
end
