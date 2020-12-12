class TableQuantity < ActiveHash::Base
  self.data = [
    { id: 1},
    { id: 2 },
    { id: 3 },
    { id: 4 },
    { id: 5 },
    { id: 6 },
    { id: 7 },
    { id: 8 }
  ]
  

  include ActiveHash::Associations
  has_many :tables
end

