require 'rails_helper'

RSpec.describe Buyer, type: :model do
    before do
      @buyer = FactoryBot.build(:buyer)
    end
  
    context '内容に問題ない場合' do
      it "priceとtokenがあれば保存ができること" do
        expect(@buyer).to be_valid
      end
    end
  
    context '内容に問題がある場合' do
      it "priceが空では保存ができないこと" do
        @buyer.price = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Price can't be blank")
      end
  
    it "tokenが空では登録できないこと" do
        @buyer.token = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Token can't be blank")
    end
  end
end
