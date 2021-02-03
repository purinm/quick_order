class Cart < ApplicationRecord
  has_many :items
  belongs_to :table


  with_options presence: true do
    validates :item_id
    validates :table_id
    validates :quantity
    end
end
