class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.string :building_number
      t.string :name
      t.decimal :construction_year, precision: 4, scale: 0
      t.float :floor_area
      t.integer :last_updated_user_id, :null => false

      t.timestamps
    end
    
    add_index :buildings, :last_updated_user_id
    add_index :buildings, :building_number, :unique => true
  end
end
