FactoryBot.define do
  factory :product do
    
    name { Faker::Name.initials(number: 2) }
    message { Faker::Lorem.sentence }
    category_id { Faker::Catefory.initials(number: 2) }
    price { Faker::Price.price(min_length: 3) }
    item_status_id { Faker::Item.status }
    shipping_cost_id { Faker::Shipping.cost }
    shipper_id { Faker::Shipper.id }
    shipping_date_id { Faker::Date.shipping }
    user { Faker::Name.user }

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end