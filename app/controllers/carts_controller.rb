class CartsController < ApplicationController
  before_action :check_session, only:[:add_item,:update_item,:delete_item]

   def index
    carts = Cart.where(table_id: session[:table_id])
    if carts.present?
      @sets = []
      carts.each do |cart|
        item = Item.find(cart[:item_id])
        @sets.push({
          item: item,
          quantity: cart[:quantity]
        })
      end
    end
   end
   
   #table登録と同時にカートをつくる(item_id= null)
   def create
   session[:table_id] = params[:table][:id]
   redirect_to items_path
   end

  # カートへ を押した時のアクション
   def add_item
    @carts = Cart.find_by(table_id: session[:table_id], item_id:params[:id]) #同じカートアイテムがないか探しておく
    if @carts.present? 
      @carts[:quantity]+= params[:quantity].to_i 
      @carts.save
    else
      @carts = Cart.create(table_id:session[:table_id], item_id:params[:id],quantity:params[:quantity])
    end
     redirect_to table_carts_path(session[:table_id])
   end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @cart = Cart.find_by(table_id: session[:table_id], item_id: params[:id])
    @cart.update(quantity: params[:quantity].to_i)
    redirect_to  table_carts_path(@cart.table_id)
  end

 # カート詳細画面から、「削除」を押した時のアクション
  def delete_item
      @cart = Cart.find_by(table_id:session[:table_id], item_id:params[:id])
      unless @cart.blank?
        @cart.destroy
      end
      redirect_to table_carts_path(@cart.table_id)
  end

  def check_session
    if session[:table_id] == nil
     redirect_to  new_table_path
    end
  end
end


