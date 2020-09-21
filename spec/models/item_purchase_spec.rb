require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @purchase = FactoryBot.build(:item_purchase)
  end

  describe '商品購入機能' do
    context '購入がうまく行くとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchase).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @purchase.building = ''
        expect(@purchase).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'post_codeが空だと購入できないこと' do
        @purchase.post_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post codeを入力してください")
      end
      it 'post_codeにはハイフンが必要であること' do
        @purchase.post_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post codeにはハイフンが必要です")
      end
      it 'prefecture_idが空だと購入できないこと' do
        @purchase.prefecture_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefectureを入力してください")
      end
      it 'cityが空だと購入できないこと' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Cityを入力してください")
      end
      it 'blockが空だと購入できないこと' do
        @purchase.block = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Blockを入力してください")
      end
      it 'phone_numberが空だと購入できないこと' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone numberを入力してください")
      end
      it 'phone_numberはハイフンが不要であること' do
        @purchase.phone_number = '090-1234-12'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone numberが正しくありません")
      end
      it 'phone_numberは12桁以上では購入できないこと' do
        @purchase.phone_number = '090123412345'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone numberが正しくありません")
      end
      it 'phone_numberは10桁未満では購入できないこと' do
        @purchase.phone_number = '09012341'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone numberが正しくありません")
      end
      it 'tokenが存在しない場合は購入できないこと' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tokenを入力してください")
      end
    end
  end
end
