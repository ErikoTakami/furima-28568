class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  has_many :comments
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :days_until_shipping

  validates :name, :text, :category, :status, :shipping_charges,
            :shipping_origin, :days_until_shipping, :price, :image, presence: true

  validates :category_id,            numericality: { other_than: 0 }
  validates :status_id,              numericality: { other_than: 0 }
  validates :shipping_charges_id,    numericality: { other_than: 0 }
  validates :shipping_origin_id,     numericality: { other_than: 0 }
  validates :days_until_shipping_id, numericality: { other_than: 0 }
  validates :price,                  numericality: { only_integer: true, message: 'は半角数字で入力してください' }
  validates :price,                  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
