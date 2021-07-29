class Product < ActiveHash::Base
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  with_options presence: true do
  validates :c
end
