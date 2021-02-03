class Purchase < ApplicationRecord
  has_many :orders

  attr_accessor :token
  
  with_options  presence: true do
    validates :token
    validates :total_cost
  end
end
