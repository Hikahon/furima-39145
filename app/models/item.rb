class Item < ApplicationRecord
  validates :item_name, presense: true
  validates :description, presence: true

  belongs_to :user
  # has_one :buyer
  has_one_attached :image
end
