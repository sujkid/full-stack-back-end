class RequestInboxSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_items_id, :status, :user_name,
             :mailing_address, :return_date
end
