FactoryBot.define do
  factory :product do
    
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end