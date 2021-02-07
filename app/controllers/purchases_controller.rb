class PurchasesController < ApplicationController
  before_action :get_total_cost, only: [:new,:create,:update,:show]
  before_action :purchase_new, only: [:new,:update]
  
  def new
  end

  def create
    # binding.pry
    #buyerが店頭決済するとき＝ admin user が手動で決済処理するとき
    if user_signed_in?
      params[:token] = "tencho_token"
    end
    
    @purchase = Purchase.new(purchase_params)  
    if @purchase.valid? # バリデーションの結果確認
      
      #buyer がクレカ決済する
      unless user_signed_in? 
        pay_item # バリデーションパスしたら支払い
      end
      @purchase.save 
    
      #オーダーテーブルに支払い記録を反映 
      @order_purhcases = Order.where(table_id:@purchase[:table_id],purchase_id:nil)
  
      @order_purhcases.each do |order_purchase|
        order_purchase.update(purchase_id:@purchase.id)
      end
    redirect_to root_path
    end
  end
  
  def show
  end

  private
  def purchase_params
    params.require(:purchase).permit(:total_cost).merge(table_id:params[:table_id],token: params[:token])
  end
  
  def purchase_new
    @purchase = Purchase.new
  end
 

  def get_total_cost
    orders = Order.where(table_id:session[:table_id],purchase_id:nil)
    @orderObject = {
      total: 0,
      rows: []
    }
    orders.each do |order|
      item = Item.find(order[:item_id])
      @orderObject[:rows].push({
        order: order,
        item: item
      })
      @orderObject[:total]+=order[:quantity]*item[:cost]
     end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAYJP側に決済情報を送るのに秘密鍵が必要,かぎを入れるクラス
    Payjp::Charge.create( # 決済に必要な情報を入れるクラス
      amount: @orderObject[:total],
      card: purchase_params[:token],
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
