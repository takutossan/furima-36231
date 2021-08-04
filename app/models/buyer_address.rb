class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product, :zip_code, :shipper_id, :municipalities, :street_number, :telephone_number, :building, :buyer

  with_options presence: true do
    validates :user_id
    validates :product
    validates :zip_code
    validates :shipper_id
    validates :municipalities
    validates :street_number
    validates :telephone_number
    validates :buyer

    def save
      buyer = Buyer.create(user: user_id, product: product)
      Address.create(zip_code: zip_code, shipper_id: shipper_id, municipalities: municipalities, street_number: street_number, telephone_number: telephone_number, building: building, buyer: buyer)
    end
  end
end