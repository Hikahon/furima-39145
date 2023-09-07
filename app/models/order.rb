class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Please enter numbers only"}
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save(user_id,params)
    buyer = Buyer.create(user_id: user_id, item_id: params[:item_id])
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, 
      city: city, street_address: street_address, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end