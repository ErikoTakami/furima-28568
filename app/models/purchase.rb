class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :item
  has_one :shipping_address
  belongs_to_active_hash :prefecture
end
