class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]

  def index
    @items = Item.all
    unless params[:keyword] == "1" || params[:keyword] == nil
       @items = Item.where(genre_id: (params[:keyword])).order(created_at: :desc)
    end
    @carts = Cart.find_by(table_id: session[:table_id])
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    end
    render 'new'
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
  #  @purchase = Purchase.where(item_id: @item.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to "/"    
    else
      render :edit
      
    end
  end

  def destroy
    # binding.pry
    @item = Item.find(params[:id])
     if  current_user.id == @item.user_id 
          @item.destroy
          redirect_to root_path
     elsif current_user.host_name.present?
         @cart_item = CartItem.find_by(params[:id]) 
         @cart = Cart.find_by(cart_item_id:@cart_item.id)
        
        if @cart.present?
          @cart.destroy
        else @cart_item.present? 
          @cart_item.delete
          @item.destroy
          redirect_to root_path
        end
      end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :description, :genre_id, :cost).merge(user_id: current_user.id)
  end
end
