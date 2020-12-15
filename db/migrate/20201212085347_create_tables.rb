class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.boolean :using ,null: false, default: true
      t.timestamps
    end
  end
end
