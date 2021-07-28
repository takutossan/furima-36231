class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  with_options presence: true do
  validates :nickname
  validates :birthday
  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
  validates :last_name
  validates :first_name
  end
  with_options format: { with: /\A[ァ-ヴー]+\z/u, message: '全角文字を使用してください' } do
  validates :last_name_kana
  validates :first_name_kana 
  end
 end 
  has_many :products
  has_many :buyers
end