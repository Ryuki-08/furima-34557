require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の保存' do
    context '商品情報がが保存できる場合' do
      it '全ての値が入力できていれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '商品情報が保存できない場合' do
      it 'imageが空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'name_descriptionが空では出品できないこと' do
        @item.name_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name description can't be blank")
      end
      it 'category_idが空では出品できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it 'product_condition_idが空では出品できないこと' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank", 'Product condition is not a number')
      end
      it 'shipping_charges_idが空では出品できないこと' do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank", 'Shipping charges is not a number')
      end
      it 'prefectures_idが空では出品できないこと' do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank", 'Prefectures is not a number')
      end
      it 'days_to_ship_idが空では出品できないこと' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank", 'Days to ship is not a number')
      end
      it 'priceが空では出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is invalid', 'Price is not a number')
      end
      it 'priceは半角数字でないと出品できないこと' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが299以下だと出品できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが10000000以上だと出品できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'nameが41文字以上だと出品できないこと' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'name_descriptionが1001文字以上だと出品できないこと' do
        @item.name_description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Name description is too long (maximum is 1000 characters)')
      end
      it 'category_idが未選択の時出品できないこと' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'product_condition_idが未選択の時出品できないこと' do
        @item.product_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Product condition must be other than 1')
      end
      it 'shipping_charges_idが未選択の時出品できないこと' do
        @item.shipping_charges_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charges must be other than 1')
      end
      it 'prefectures_idが未選択の時出品できないこと' do
        @item.prefectures_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures must be other than 1')
      end
      it 'days_to_ship_idが未選択の時出品できないこと' do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
    end
  end
end
