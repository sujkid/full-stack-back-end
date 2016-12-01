# frozen_string_literal: true
# Example serializer
class ExampleSerializer < ActiveModel::Serializer
  attributes :id, :text, :editable

  def editable
    scope == object.user
  end
end
