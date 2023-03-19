class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :postcode,          null: false
      t.integer :region_id,        null: false
      t.string :municipalities,    null: false
      t.string :address,           null: false
      t.string :building 
      t.string :tell,              null: false
      t.references :order,          null: false, foreign_key: true 
      t.timestamps
    end
  end
end
