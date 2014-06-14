class Provider < ActiveRecord::Base
  attr_accessible :name, :description, :address, :phone_number, :email, :website

  belongs_to :region

  validates :name, :phone_number, :region, presence: true
end
