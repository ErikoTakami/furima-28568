require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    it '画像が1枚ないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end
    it '商品名が空だと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it '商品の説明が空だと出品できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it 'カテゴリーの情報が選択されていないと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Categoryを入力してください")
    end
    it '商品の状態の情報が選択されていないと出品できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Statusを入力してください")
    end
    it '配送料の負担の情報が選択されていないと出品できない' do
      @item.shipping_charges_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping chargesを入力してください")
    end
    it '発送元の地域の情報が選択されていないと出品できない' do
      @item.shipping_origin_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping originを入力してください")
    end
    it '発送までの日数の情報が選択されていないと出品できない' do
      @item.days_until_shipping_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days until shippingを入力してください")
    end
    it '価格が空だと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end
    it '価格の範囲が、300円未満だと出品できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は¥300〜9,999,999の間で設定してください")
    end
    it '価格の範囲が、9,999,999円を超過すると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は¥300〜9,999,999の間で設定してください")
    end
    it '販売価格は半角数字でないと出品できない' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は半角数字で入力してください")
    end
  end
end
