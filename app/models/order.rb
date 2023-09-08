class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, length: { minimum: 10, maximum: 11 , message: "is too short"}
    validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input only number" }
  end

  def save(user_id,params)
    buyer = Buyer.create(user_id: user_id, item_id: params[:item_id])
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, 
      city: city, street_address: street_address, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end