# frozen_string_literal: true
# User class
class User < ActiveRecord::Base
  include Authentication
  has_many :examples
  has_many :user_items
end
