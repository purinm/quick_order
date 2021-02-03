require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe "支払い記録の保存" do
    before do
      @table = FactoryBot.create(:table, using: true)
      @purchase = FactoryBot.build(:purchase, table_id: @table.id)
     end
    context "クレジット支払いできる" do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@purchase).to be_valid
      end
    end
    context "クレジット支払いできない" do
      it 'tokenが空だと保存できないこと' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'total_costが空だと保存できないこと' do
        @purchase.total_cost = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Total cost can't be blank")
      end
    end
  end
end
