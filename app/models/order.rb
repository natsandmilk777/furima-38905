class Order < ApplicationRecord
  attr_accessor :token
  attr_accessor :postal_code
  attr_accessor :phone_number
  attr_accessor :building_name
  attr_accessor :prefecture_id
  attr_accessor :city
  belongs_to :user
  belongs_to :item
  has_one :address

  validates :price, presence: true
  validates :token, presence: true
end