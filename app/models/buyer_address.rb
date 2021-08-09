class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :zip_code, :shipper_id, :municipalities, :street_number, :telephone_number, :building, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :street_number
    validates :telephone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :telephone_number, format: {with: \A[ぁ-ゔァ-ヴ\p{Ideographic}a-zA-Z0-9]+\z , message: "is invalid."}
    validates :token
  end
    validates :shipper_id, numericality: { other_than: 0, message: "can't be blank" }

    def save
      buyer = Buyer.create(user_id: user_id, product_id: product_id)
      Address.create(zip_code: zip_code, shipper_id: shipper_id, municipalities: municipalities, street_number: street_number, telephone_number: telephone_number, building: building, buyer_id: buyer.id)
    end
 
end