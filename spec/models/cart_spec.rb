require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "カート保存" do
    before do
      @item = FactoryBot.create(:item)
      @table = FactoryBot.create(:table,using: true)
      @cart = FactoryBot.build(:cart,item_id:@item.id,table_id:@table.id)
    end
    context "メニューをカートに保存できる" do
      it "適切な入力値だとカート保存できる" do
        expect(@cart).to be_valid
      end
    end
    context "メニューをカートに保存できない" do
      it "item_idが空だとカート保存できない" do
        @cart.item_id = nil
        @cart.valid?
      end
      it "table_idが空だとカート保存できない" do
        @cart.table_id = nil
        @cart.valid?
      end
      it "quantityが空だとカート保存できない" do
        @cart.quantity = nil
        @cart.valid?
      end
    end
  end
end
