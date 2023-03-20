require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '正常に登録できる時' do
      it 'itemnameとexplanationとimageとcategory_idとstate_idとregion_idとshopping_fee_idとcheduled_delivery_idとprice商品出品ができる' do
        expect(@item).to be_valid
      end
      it '価格が半角数字であれば登録できる' do
        @item.price = '600'
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない時' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item nameを入力してください"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanationを入力してください"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Imageを入力してください"
      end
      it 'categoryに「----」が選択されている場合は登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Categorycan't be blank"
      end
      it 'stateに「----」が選択されている場合は登録できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Statecan't be blank"
      end
      it 'regionに「----」が選択されている場合は登録できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Regioncan't be blank"
      end
      it 'shopping_feeに「----」が選択されている場合は登録できない' do
        @item.shopping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shopping feecan't be blank"
      end
      it 'scheduled_deliveryに「----」が選択されている場合は登録できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled deliverycan't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Priceを入力してください"
      end
      it 'priceは300円未満では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Priceは300以上の値にしてください'
      end
      it 'priceが10000000より多い時は登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Priceは9999999以下の値にしてください'
      end
      it 'priceは全角では登録できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは数値で入力してください')
      end
      it 'priceが小数点を含んでいると登録できない' do
        @item.price = '1000.45'
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは整数で入力してください')
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
