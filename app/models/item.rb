class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, :state_id, :shipping_fee_id, :prefecture_id, :shipping_duration_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :price, presence: true

  belongs_to :user
  # has_one :buyer
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_duration
end