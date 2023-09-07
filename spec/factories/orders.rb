FactoryBot.define do
  factory :order do
    transient do
      address { Gimei.address }
    end
    item_id { 1 }
    user_id { 1 }
    postal_code { Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    prefecture_id { 2 }
    city { address.city.kanji }
    street_address { Faker::Address.street_address }
    building { Faker::Address.building_number }
    phone_number { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
  end
end