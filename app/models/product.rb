class Product < ActiveHash::Base
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  with_options presence: true do
  validates :name
  validates :message
  validates :category_id
  validates :price
  validates :item_status_id
  validates :shipping_cost_id
  validates :shipper_id
  validates :shipping_date_id
  validates :user
end
