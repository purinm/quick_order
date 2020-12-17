class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]
  # after_action  :set_table_number, only: [:create]

   def show
     @nilcart = Cart.find_by(item_id:nil)
     if @nilcart.blank?
     @carts = Cart.all  
     @items = []
     @carts.each do |cart|
     @items.push(Item.find(cart[:item_id]))
      end
     @table_num = @carts[0][:table_id]
    end
   end
   
   #table登録と同時にカートをつくる(item_id= null)
   def create
   @cart = Cart.create(table_id:params[:table][:id])
    redirect_to items_path
   end

  # カートへ を押した時のアクション
   def add_item
     if @nilcart.present?
        @first_cart = Cart.update(item_id:params[:id],quantity:params[:item][:quantity])
     elsif @carts.present?
           @carts[:quantity]+= params[:item][:quantity].to_i 
           @carts.save
     else  @nilcart = Cart.all
          table_num = @nilcart[0][:table_id]
          @carts = Cart.create(table_id:table_num,item_id:params[:id],quantity:params[:item][:quantity])
     end
     redirect_to items_path
   end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @cart = Cart.find_by(item_id: params[:id])
    @cart.update(quantity: params[:quantity].to_i)
    redirect_to cart_path
  end

 # カート詳細画面から、「削除」を押した時のアクション
  def delete_item
      @cart = Cart.find_by(item_id:params[:id])
      @cart.destroy
      redirect_to cart_path
  end

  private
  def setup_cart_item!
    @nilcart = Cart.find_by(item_id:nil) #カートのitem_id=nulのレコードを探しておく
    @carts = Cart.find_by(item_id: params[:id]) #同じカートアイテムがないか探しておく
    
  end

end


