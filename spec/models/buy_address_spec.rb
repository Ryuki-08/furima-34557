require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end
  describe '住所の保存' do
    context '住所が保存できる場合' do
      it '全ての値が入力できていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'building_nameが空でも購入できること' do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end
    end
    context '住所が保存できない場合' do
      it 'tokenがからでは保存できない' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存ができない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank",
                                                             'Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectures_idが空だと保存できない' do
        @buy_address.prefectures_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'municipalityが空だと保存できない' do
        @buy_address.municipality = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空だと保存できない' do
        @buy_address.house_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end
      it 'postal_codeにハイフンがないと保存できない事' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'phone_numberは12桁以上の数値では保存できないこと' do
        @buy_address.phone_number = '080123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'prefectures_idが1だと保存できない' do
        @buy_address.prefectures_id = '1'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'user_idが空の場合は保存できない' do
        @buy_address.user_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空の場合は保存できない' do
        @buy_address.item_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
