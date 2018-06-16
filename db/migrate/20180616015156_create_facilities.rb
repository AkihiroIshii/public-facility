class CreateFacilities < ActiveRecord::Migration[5.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :district
      t.string :address
      t.string :facility_type
      t.float :floor_area
      t.string :division_in_charge
      t.integer :last_updated_user_id, :null => false
      
      t.timestamps
    end
    
    add_index :facilities, :last_updated_user_id
  end
end
