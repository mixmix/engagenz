class Provider < ActiveRecord::Base
  attr_accessible :name, :description, :address, :phone_number, :email, :website, :region_id, :category_ids

  belongs_to :region
  has_and_belongs_to_many :categories

  validates :name, :phone_number, :region, presence: true
end
