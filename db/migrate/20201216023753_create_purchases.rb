class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
     t.references :table,    null: false              
     t.integer  :total_cost, null: false              
     t.timestamps
    end
  end
end
