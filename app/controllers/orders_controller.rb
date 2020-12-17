class OrdersController < ApplicationController

  def index
    ActiveRecord::Base.connection.execute('insert ignore into orders (item_id, table_id,quantity) select item_id, table_id,quantity from carts')
    carts = Cart.all
    carts.destroy_all
    ActiveRecord::Base.connection.execute('ALTER TABLE carts AUTO_INCREMENT = 1')
    orders = Order.all
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
end
