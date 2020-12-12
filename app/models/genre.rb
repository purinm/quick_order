class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '全メニュー' },
    { id: 2, name: 'サラダ・スープ' },
    { id: 3, name: 'メイン' },
    { id: 4, name: 'おつまみ' },
    { id: 5, name: 'パン・ご飯' },
    { id: 6, name: 'デザート' },
    { id: 7, name: 'ドリンク' },
    { id: 8, name: 'その他' }
  ]
  

  include ActiveHash::Associations
  has_many :items
end
