class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :table,       null: false, foreign_key: true  
      t.references :item,        null: true
      t.integer :quantity,       null: false ,default: 0  
      t.timestamps
    end
  end
end
