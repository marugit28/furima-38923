require 'rails_helper'

RSpec.describe OrderPlace, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_place = FactoryBot.build(:order_place, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_place).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_place.building = ''
        expect(@order_place).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'userが紐付いていないと保存できないこと' do
        @order_place.user_id = nil
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_place.item_id = nil
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Item can't be blank")
      end
      it 'postcodeが空だと保存できないこと' do
        @order_place.postcode = ''
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_place.postcode = '1234567'
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'regionを選択していないと保存できないこと' do
        @order_place.region_id = '1'
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Region can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @order_place.municipalities = ''
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_place.address = ''
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Address can't be blank")
      end
      it 'tellが空だと保存できないこと' do
        @order_place.tell = ''
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Tell can't be blank")
      end
      it 'tellの桁数が10桁未満だと保存できないこと' do
        @order_place.tell = '000000000'
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include('Tell is invalid')
      end
      it 'tellの桁数が12桁以上だと保存できないこと' do
        @order_place.tell = '000000000000'
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include('Tell is invalid')
      end
      it 'tellが全角数字だと保存できないこと' do
        @order_place.tell = '２０００'
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include('Tell is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @order_place.token = nil
        @order_place.valid?
        expect(@order_place.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
