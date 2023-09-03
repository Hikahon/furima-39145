FactoryBot.define do
  factory :item do
    item_name {Faker::Name.name}
    description {Faker::Lorem.sentence}
    category_id { 2 }
    state_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_duration_id { 2 }
    price {Faker::Number.between(from: 300, to: 9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end