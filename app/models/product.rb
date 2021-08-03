class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipper
  belongs_to :shipping_date
  has_one :buyer

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipper_id
    validates :shipping_date_id
  end
  with_options presence: true do
    validates :name
    validates :message
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end
end
