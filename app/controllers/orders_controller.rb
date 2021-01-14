class OrdersController < ApplicationController
 before_action :get_table_num

 def create
    # binding.pry
   #カート情報をオーダーテーブルにコピー
   ActiveRecord::Base.connection.execute('insert ignore into orders (item_id, table_id,quantity) select item_id, table_id,quantity from carts')
   #カート内を空に
   carts = Cart.all
   carts.destroy_all
   #カートテーブルをリセット
   ActiveRecord::Base.connection.execute('ALTER TABLE carts AUTO_INCREMENT = 1')

   redirect_to orders_path
 end

  def index

    if user_signed_in?
       @orders = Order.all
       @orderObject = {
        total: 0,
        rows: []
       }
       @orders.each do |order|
        item = Item.find(order[:item_id])
        @orderObject[:rows].push({
          order: order,
          item: item
        })
        @orderObject[:total]+=order[:quantity]*item[:cost]
        
        
      
      end
    else
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
      unless @order.present?
        redirect_to  items_path
      end
    end
  
  end

  def update
     binding.pry
    params[:reserved].each do |r|
      order = Order.find(r)
      order.update(reserved:true)
    end
  end


  def get_table_num
   @order = Order.find_by(table_id: session[:table_id])
  end

  private
  def order_params
    params.permit(:reserved)
  end

end



