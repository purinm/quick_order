require 'rails_helper'

RSpec.describe Table, type: :model do
  before do
    @table = FactoryBot.build(:table)
  end
  
  describe "テーブル登録" do
    context  "テーブル登録できること" do
      it "必要な情報が剃ろうとテーブル登録できる" do
        expect(@table).to be_valid
      end
    end
    context  "テーブル登録できないこと" do
      it "table使用・未使用どちらでもないと新規登録できない" do
        @table.using = nil 
        @table.valid?
       
      end
    end
  end
end
