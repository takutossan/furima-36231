require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer_address = FactoryBot.build(:buyer_address)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buyer_address).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @buyer_address.building = ''
      expect(@buyer_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'zip_codeが空だと保存できないこと' do
      @buyer_address.zip_code = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Zip code can't be blank")
    end
    it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buyer_address.zip_code = '1234567'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
    end
    it 'shipper_idを選択していないと保存できないこと' do
      @buyer_address.shipper_id = 0
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Shipper can't be blank")
    end
    it 'municipalitiesが空だと保存できないこと' do
      @buyer_address.municipalities = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'street_numberが空だと保存できないこと' do
      @buyer_address.street_number = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Street number can't be blank")
    end
    it 'telephone_numberが空だと保存できないこと' do
      @buyer_address.telephone_number = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Telephone number can't be blank")
    end
  end
end
