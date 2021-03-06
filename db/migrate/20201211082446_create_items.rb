class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references  :user,     null: false , foreign_key: true 
      t.string :name,          null: false                     
      t.text :description                                     
      t.integer :genre_id,     null: false                     
      t.integer  :cost,        null: false                     
      t.timestamps
    end
  end
end
