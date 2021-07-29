require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '商品出品機能' do
    context '商品出品できる時' do
      it 'nameとmessage、category_id、price、item_status_id、shipping_cost_id、shipper_id、shipping_date_idとuserが存在すれば出品できる' do
      expect(@product).to be_valid
    end
  end
    context '商品出品できないとき' do
      it 'nameが空だと登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end
      it 'messageが空だと登録できない' do
        @product.message = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Message can't be blank"
      end
      it 'category_idが空だと登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Category id can't be blank"
      end
      it 'priceが空だと登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end
      it 'item_status_idが空だと登録できない' do
        @product.item_status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Item status id can't be blank"
      end
      it 'shipping_cost_idが空だと登録できない' do
        @product.shipping_cost_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipping cost id can't be blank"
      end
      it 'shipper_idが空だと登録できない' do
        @product.shipper_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipper id can't be blank"
      end
      it 'shipping_date_idが空だと登録できない' do
        @product.shipping_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipping date id can't be blank"
      end
      it 'userが空だと登録できない' do
        @product.user = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "User can't be blank"
      end
    end
  end
end