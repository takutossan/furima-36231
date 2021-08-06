FactoryBot.define do
  factory :buyer_address do
    zip_code { '123-4567' }
    shipper_id { 1 }
    municipalities { '東京都' }
    street_number { '1-1' }
    building { '東京ハイツ' }
    telephone_number { '09011112222' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
