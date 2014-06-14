class Category < ActiveRecord::Base
  attr_accessible :name

  validate :name, presence: true
  has_and_belongs_to_many :providers
end
