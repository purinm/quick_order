class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
    t.references :table,     null: false, foreign_key:true  
    t.references :item,      null: false                     
    t.integer	 :quantity,    null: false, default: 0           
    t.references :purchase,  null: false, foreign_key:true   
    t.timestamps
    end
  end
end
