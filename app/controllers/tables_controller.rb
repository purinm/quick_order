class TablesController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]

 def index
  @tables = Table.all
 end

 def new
  #  binding.pry
  @tables = Table.all
  
 unless user_signed_in? 
  render :new
 end 
return

 if @tables.present?
    render :index
  else
    render :create
  end
end
 

 def update
   @tables = Table.all
  table = Table.find_by(params[:id])
  if table.using == true
  table.update(using: false)
  else
  table.update(using: true)
  end
  redirect_to tables_path
 end

 
  def create 
    # binding.pry
    @tables = Table.all
    if user_signed_in? 
    #テーブルの数numだけレコードを作る
     @tables.destroy_all
     ActiveRecord::Base.connection.execute('ALTER TABLE tables AUTO_INCREMENT = 1')
    #もしテーブルがすでにあるなら全て削除してからid１から作り直す
     @tables = [] 
      num = params[:table_quantity_id].to_i
      num.times do 
      @tables.push(Table.create)
      end
      redirect_to tables_path
    # else
    #   @table = Table.create(ids:params[:table_id].to_a)   
      # @cart = Cart.create(table_id:@table.id) 
  
    end
  end

private
  def table_params
    params.require(:table)
  end
end
