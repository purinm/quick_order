class TablesController < ApplicationController
  
 def index
  @tables = Table.all
 end
 def new
 end
 
  def create #テーブルの数numだけレコードを作る
    @tables = Table.all
    if @tables.present?
      @tables.destroy_all
     ActiveRecord::Base.connection.execute('ALTER TABLE tables AUTO_INCREMENT = 1')
    #もしテーブルがすでにあるなら全て削除してから作り直す
    end
      @tables = [] 
      num = params[:table_quantity_id].to_i
      num.times do 
      @tables.push(Table.create)
      end
    redirect_to "/"
  end
end
