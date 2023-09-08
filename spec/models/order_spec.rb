require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item)
    item.image = fixture_file_upload('public/images/test.png')
    item.save
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品の購入ができるとき' do
      it '全ての項目が適切に存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end
    context '商品の購入ができないとき' do
      it 'tokenが空では購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeは3桁ハイフン4桁の並びでなければ購入できない' do
        @order.postal_code = '1234-567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeはハイフンを含んでいても全角では購入できない' do
        @order.postal_code = '１２３-４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefectureが未選択では購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では購入できない' do
        @order.street_address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは10桁以上でなければ購入できない' do
        @order.phone_number = '0123456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberにハイフンを含んでいると購入できない' do
        @order.phone_number = '080-1234-56'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが全角では購入できない' do
        @order.phone_number = '０１２３４５６７８９'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
  end
end
