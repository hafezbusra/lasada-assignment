class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :model
      t.text :description
      t.text :contact
      t.string :condition
      t.string :finish
      t.string :title
      t.decimal :price, precision: 10, scale: 2, default: 0
      t.integer :quantity, precision: 10, default: 0

      t.timestamps
    end
  end
end
