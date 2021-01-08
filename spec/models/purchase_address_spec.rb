require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'postcode,area_id,city,house_num,building,phone_num,user_id,item_id,tokenがあれば登録可能' do
        expect(@purchase_address).to be_valid
      end

      it 'buildingは空でも登録できる' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'postcodeが空では登録できない' do
        @purchase_address.postcode  = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postal_codeは全角では登録できない' do
        @purchase_address.postcode = '１２３−４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postcode is invalid')
      end

      it 'postcodeは半角でハイフンを含んだ正しい形でないと登録できない' do
        @purchase_address.postcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postcode is invalid')
      end

      it 'area_idが1では登録できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Area Select')
      end

      it 'cityが空では登録できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numが空では登録できない' do
        @purchase_address.house_num = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House num can't be blank")
      end

      it 'phone_numが空では登録できない' do
        @purchase_address.phone_num = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numが全角では登録できない' do
        @purchase_address.phone_num = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid')
      end

      it 'phone_numにハイフンがあると登録できない' do
        @purchase_address.phone_num = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid')
      end

      it 'phone_numが12桁以上では登録できない' do
        @purchase_address.phone_num = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid')
      end

      it 'tokenが空では登録できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idがないと登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idがないと登録できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

