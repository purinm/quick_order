class TablesController < ApplicationController
  # before_action :authenticate_user!
  before_action :clean_table, only:[:create]

 def index  
  @tables = Table.all
 end
 
  def new
   @tables = Table.all
   unless user_signed_in?
      render new_table_path
   else

      if @tables.present?
          redirect_to tables_path
      else
          render :create
      end
    end
  end

  def create 
    @tables = []
    if params[:table_quantity_id].present?
      num = params[:table_quantity_id].to_i
      num.times do
        @tables.push(Table.create!)
      end
      redirect_to tables_path
    else
      redirect_to new_table_path
    end
  end
  
  def clean_table
  @tables = Table.all
   #テーブルの数numだけレコードを作る
    if @tables.present?
       @tables.destroy_all
       ActiveRecord::Base.connection.execute('ALTER TABLE tables AUTO_INCREMENT = 1')
      #もしテーブルがすでにあるなら全て削除してからid１から作り直す
    end
  end


 
end
