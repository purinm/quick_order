require 'rails_helper'

RSpec.describe Item, type: :model do
  
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
    end
    
    describe "メニュー新規登録できる" do
      it "適切な入力値だと新規登録できる" do
        expect(@item).to be_valid
      end
      it 'メニューの紹介が空でも登録できる' do
        @item.description = nil
        expect(@item).to be_valid
       end
    end
    
    describe "メニュー新規登録できない" do
      it "nameの入力がないと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品画像を1枚つけることが必須であること'do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "costの入力がないと登録できない" do
        @item.cost = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it "genre_idの入力がないと登録できない" do
        @item.genre_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it "genre_idが1だと登録できない" do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre must be other than 1")
      end
      it "costが半角数字以外だと登録できない" do
        @item.cost = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost は半角数字で入力してください')
      end

      it "costの範囲が、300円未満で登録できないこと" do
        @item.cost = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost は300~99.999円までの範囲で入力してくだい")
      end
      it 'costの範囲が、¥9.999.999円より値段が高いと登録できないこと' do
        @item.cost = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost は300~99.999円までの範囲で入力してくだい")
      end
    end
end
