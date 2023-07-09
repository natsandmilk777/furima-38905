require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it '全ての入力が適切であれば登録できること' do
        expect(@order_address).to be_valid
      end

      it '郵便番号は半角数字かつハイフンを含んでいれば登録できること' do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end

      it '電話番号は半角数字かつ11桁以内であれば登録できること' do
        @order_address.phone = '09012345678'
        expect(@order_address).to be_valid
      end

      it '建物名は空でも登録できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では登録できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が全角数字では登録できないこと' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code は半角数字でハイフンを含み入力してください')
      end

      it '郵便番号がハイフンを含まなければ登録できないこと' do
        @order_address.postal_code = 1_234_567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code は半角数字でハイフンを含み入力してください')
      end

      it '都道府県を選択しなければ登録できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture を選択してください')
      end

      it '市区町村が空では登録できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できないこと' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が空では登録できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号が全角では登録できないこと' do
        @order_address.phone = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone は半角数字で入力してください')
      end

      it '電話番号が半角英数混合では登録できないこと' do
        @order_address.phone = 'abc12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone は半角数字で入力してください')
      end

      it '電話番号が12桁以上では登録できないこと' do
        @order_address.phone = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone は11桁以内で入力してください')
      end

      it 'クレジットカード情報が空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
