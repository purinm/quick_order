require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "オーダー情報の保存" do
    before do
        @item = FactoryBot.create(:item)
        @table = FactoryBot.create(:table,using:true)
        @cart = FactoryBot.create(:cart,item_id:@item.id,table_id:@table.id)
        @purchase = FactoryBot.create(:purchase,table_id:@table.id)
        @order = FactoryBot.build(:order, table_id: @cart[:table_id], item_id: @cart[:item_id], purchase_id:@purchase[:id])
    end

    context "オーダーが保存できる" do
      it "すべての値が正しく入力されていれば保存できること" do
        @order.reserved = true
        expect(@order).to be_valid
      end
    end
    context "オーダーが保存できない" do
      it 'reservedが空だと保存できないこと' do
        @order.reserved = nil
        @order.valid?
      end
      it 'table_idが空だと保存できないこと' do
        @order.table_id = nil
        @order.valid?
      end
      it 'item_idが空だと保存できないこと' do
        @order.item_id = nil
        @order.valid?
      end
      it 'quantityが空だと保存できないこと' do
        @order.quantity = nil
        @order.valid?
      end
    end
  end
end
