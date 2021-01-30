class PurchasesController < ApplicationController
  before_action :get_total_cost, only: [:index,:create,:update]
  before_action :purchase_new, only: [:index,:update]
  
  def index
     
  end

  def create
    #buyer がクレカ決済する
    binding.pry
    @purchase = Purchase.new(purchase_params)  
    if @purchase.valid? # バリデーションの結果確認
      
      #buyerが店頭決済するとき＝ admin user が手動で決済処理するとき
      unless user_signed_in? 
        pay_item # バリデーションパスしたら支払い
      end
      @purchase.save 
    
      #オーダーテーブルに支払い記録を反映 
      @order_purhcases = Order.where(table_id:@purchase[:table_id],purchase_id:nil)
      @order_purhcases.each do |order_purchase|
        order_purchase.update(purchase_id:@purchase.id)
      end
      #オーダーテーブルの支払いチェックがつくビュー！
      redirect_to root_path
    else
      render 'index'
    end
  end

  def update
    purchase = Purchase.create(table_id:params[:table_id],total_cost:params[:total_cost])

    params[:order_id].split(' ').map{|n| n.to_i}.each do |params_order|
    Order.where(id:params_order,purchase_id:nil).update_all(purchase_id:purchase.id)
    end
   redirect_to orders_path
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
