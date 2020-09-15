class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :category,            numericality: { other_than: 0 }
    validates :status,              numericality: { other_than: 0 }
    validates :shipping_charges,    numericality: { other_than: 0 }
    validates :shipping_origin,     numericality: { other_than: 0 }
    validates :days_until_shipping, numericality: { other_than: 0 }
    validates :price,               numericality: { only_integer: true, message: 'は半角数字で入力してください' }
    validates :image
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
