require 'rails_helper'

describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が入力されていれば出品ができる' do
      
      end
    
    context '商品出品がうまくいかないとき' do
      it 'imageが空では登録されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では登録されない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では登録されない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
        it 'category_idが空では登録されない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
        it 'sales_status_idが空では登録されない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank", "Sales status is not a number")
      end
        it 'shipping_fee_status_idが空では登録されない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", "Shipping fee status is not a number")
      end
      it 'prefecture_idが空では登録されない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it 'scheduled_delivery_idが空では登録されない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", "Scheduled delivery is not a number")
      end
      it 'それぞれのidで1が選択された場合は登録されない' do
        @item.category_id = '1'
        @item.sales_status_id = '1'
        @item.shipping_fee_status_id = '1' 
        @item.prefecture_id = '1'
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1", "Sales status must be other than 1", "Shipping fee status must be other than 1", "Prefecture must be other than 1", "Scheduled delivery must be other than 1")
      end
      it 'priceが空では登録されない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300より少ないと登録できない' do
        @item.price = "50"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'priceが9999999より多いと登録できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
    end

    end
  end
end
