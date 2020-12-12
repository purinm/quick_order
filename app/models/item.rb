class Item < ApplicationRecord
  belongs_to :user
  # belongs_to :purchase
  # belongs_to_active_hash :genre
  # belongs_to :cart_item, optional: true
  # has_one_attached :image,dependent: true
  # has_many_attached :images

  with_options presence: true do
  validates :name
  end
  
  with_options presence: true, numericality: { other_than: 1 } do
    validates :genre_id
                        
  validates :cost, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  validates :cost, inclusion: { in: 200..99_999, message: 'は300~99.999円までの範囲で入力してくだい' }
 end


 def self.search(keyword)
    if search != ""
      Item.where('name LIKE(?)')
      @items = Item.where(:genre_id)
    else
      Item.all
    end
  end
end
