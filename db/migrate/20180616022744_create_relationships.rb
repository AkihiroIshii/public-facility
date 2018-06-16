class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :facility, foreign_key: true
      t.references :building, foreign_key: true

      t.timestamps
      
      t.index [:facility_id, :building_id], unique: true
    end
  end
end
