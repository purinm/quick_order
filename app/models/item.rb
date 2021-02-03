class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :genre
  has_one_attached :image, dependent: true

  with_options presence: true do
  validates :name
  validates :cost
  validates :image
  end
  
  with_options presence: true, numericality: { other_than: 1 } do
    validates :genre_id
  end
                        
  validates :cost, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  validates :cost, inclusion: { in: 300..99_999, message: 'は300~99.999円までの範囲で入力してくだい' }
 


 def self.search(keyword)
    if search != ""
      Item.where('name LIKE(?)')
      @items = Item.where(:genre_id)
    else
      Item.all
    end
  end
end
