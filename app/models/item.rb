class Item < ApplicationRecord
  validates :item_name, presense: true
  validates :description, presence: true

  belongs_to :user
  # has_one :buyer
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :state, :shipping_fee, :prefecture, :shipping_duration
end