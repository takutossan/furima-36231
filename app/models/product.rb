class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipper
  belongs_to :shipping_date


  with_options numericality: { other_than: 1 , message: "can't be blank"} do
  validates :category_id
  validates :price
  validates :item_status_id
  validates :shipping_cost_id
  validates :shipper_id
  validates :shipping_date_id
  end
  with_options presence: true do
  validates :name
  validates :message
 end
end