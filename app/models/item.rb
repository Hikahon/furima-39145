class Item < ApplicationRecord
  validates :item_name, presense: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category_id, :state_id, :shipping_fee_id, :prefecture_id, :shipping_duration_id, numericality: { other_than: 1 , message: "can't be blank" } 

  belongs_to :user
  # has_one :buyer
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :state, :shipping_fee, :prefecture, :shipping_duration
end