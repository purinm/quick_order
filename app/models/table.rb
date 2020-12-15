class Table < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :table_quantity
  has_many :orders
  has_many :carts
  has_one :purchase
end
