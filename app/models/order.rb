class Order < ApplicationRecord
 belongs_to :purchase 
 belongs_to :table 
 has_many :items 

end
