require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it '全ての入力が適切であれば登録できること' do
        expect(@order).to be_valid
      end

      it '郵便番号は半角数字かつハイフンを含んでいれば登録できること' do
        @order.postal_code = '123-4567'
        expect(@order).to be_valid
      end

      it '電話番号は半角数字かつ11桁以内であれば登録できること' do
        @order.phone_number = '09012345678'
        expect(@order).to be_valid
      end

      it '建物名は空でも登録できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      
      it 'user_idが空では登録できないこと' do
        @order.user_id = ' '
        @order.valid?
        expect(@order.errors.full_messages).to include("User must exist")
      end

      it 'item_idが空では登録できないこと' do
        @order.item_id = ' '
        @order.valid?
        expect(@order.errors.full_messages).to include("Item must exist")
      end

      it "tokenが空では登録できないこと" do
        @order.token = ' '
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
