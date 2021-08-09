class Buyer < ApplicationRecord
has_one    :address
belongs_to :user
belongs_to :product
attr_accessor :token
end
