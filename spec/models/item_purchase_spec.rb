require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @purchase = FactoryBot.build(:item_purchase)
  end

  describe '商品購入機能' do
    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@purchase).to be_valid
    end
    it 'numberが空だと購入できないこと' do
      @purchase.number = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include
    end
    it 'cvcが空だと購入できないこと' do
      @purchase.cvc = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include
    end
    it 'exp_monthが空だと購入できないこと' do
      @purchase.exp_month = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include
    end
    it 'exp_yearが空だと購入できないこと' do
      @purchase.exp_year = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include
    end
    it 'post_codeが空だと購入できないこと' do
      @purchase.post_code = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeにはハイフンが必要であること' do
      @purchase.post_code = '1234567'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'prefecture_idが空だと購入できないこと' do
      @purchase.prefecture_id = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと購入できないこと' do
      @purchase.city = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと購入できないこと' do
      @purchase.block = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Block can't be blank")
    end
    it 'buildingは空でも購入できること' do
      @purchase.building = ''
      expect(@purchase).to be_valid
    end
    it 'phone_numberが空だと購入できないこと' do
      @purchase.phone_number = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberはハイフンが不要であること' do
      @purchase.phone_number = '090-1234-12'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberは11桁以上では購入できないこと' do
      @purchase.phone_number = '090123412345'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberは10桁未満では購入できないこと' do
      @purchase.phone_number = '09012341'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end
    it 'tokenが存在しない場合は購入できないこと' do
      @purchase.token = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end
