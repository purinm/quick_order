class OrdersController < ApplicationController
 before_action :get_table_num

 def create
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
        checked_rows: [],
        unchecked_rows: []
       }
       @orders.each do |order|
        item = Item.find(order[:item_id])
          if order.reserved == true
            @orderObject[:checked_rows].push({
              order: order,
              item: item
            })
          elsif order.reserved == false
            @orderObject[:unchecked_rows].push({
              order: order,
              item: item
            })
          end
          @orderObject[:total]+=order[:quantity]*item[:cost]
        end
      
     else
      @ordered = Order.where(table_id:session[:table_id])
      @orderedObject = {
       total: 0,
       rows: []
      }
      @ordered.each do |ordered|
       orderedItem = Item.find(ordered[:item_id])
           @orderedObject[:rows].push({
             order: ordered,
             item: orderedItem
           })
       @orderedObject[:total]+=ordered[:quantity]*orderedItem[:cost]
      end
      unless @order.present?
        redirect_to  items_path
      end
    end
  
  end

  def update
    unless params[:reserved].blank?
      params[:reserved].each do |r|
      Order.where(id:r).update_all(reserved:true)
      end
      redirect_to orders_path
   end
  end

  def show
    @purchase = Purchase.all
    @orders = Order.where(table_id:params[:table][:id],purchase_id:nil)    
    @orderObject = {
      total: 0,
      rows: [],
      order_table_id:params[:table][:id]
    }
    @orders.each do |order|
      item = Item.find(order[:item_id])
      @orderObject[:rows].push({
        order: order,
        item: item
      })
      @orderObject[:total]+=order[:quantity]*item[:cost]
    end
  end

  def get_table_num
   @order = Order.find_by(table_id: session[:table_id])
  end

  private
  def order_params
    params.require(:order).permit(:reserved)
  end
  

end



