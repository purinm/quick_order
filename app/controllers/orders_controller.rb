class OrdersController < ApplicationController

  def index
    ActiveRecord::Base.connection.execute('insert ignore into orders (item_id, table_id,quantity) select item_id, table_id,quantity from carts')
    carts = Cart.all
    carts.destroy_all
    ActiveRecord::Base.connection.execute('ALTER TABLE carts AUTO_INCREMENT = 1')

    # binding.pry
    orders = Order.all
    @rows = []
    orders.each do |order|
    @rows.push({
      order: order,
      item: Item.find(order[:item_id])
    })

   
   end
   
  end
end
