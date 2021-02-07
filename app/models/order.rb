class Order < ApplicationRecord
 belongs_to :purchase 
 belongs_to :table 
 has_many :items 

 with_options  presence: true do
    validates :item_id
    validates :table_id
  end  
end
