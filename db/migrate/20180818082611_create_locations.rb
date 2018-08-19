class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.integer :product_id 	
      t.integer :user_id, 		null: false
      t.integer :status,		  null: false, default: 0
      t.decimal :lat,         precision: 8, scale: 6, null: false
      t.decimal :long, 			  precision: 9, scale: 6, null: false
      t.text	:msg
      t.timestamps
    end
  end
end
