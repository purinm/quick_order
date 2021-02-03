class Table < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :table_quantity
  
  with_options  presence: true do
    validates :using
  end
end