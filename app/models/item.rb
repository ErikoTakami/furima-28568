class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :text
    validates :category
    validates :status
    validates :shipping_charges
    validates :shipping_origin
    validates :days_until_shipping
    validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  end
end
