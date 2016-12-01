# frozen_string_literal: true
# Example class
class Example < ActiveRecord::Base
  belongs_to :user
  validates :text, :user, presence: true
end
