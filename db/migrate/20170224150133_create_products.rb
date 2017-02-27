#Creating Products
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku_id
      t.integer :price
      t.text :description
      t.datetime :expire_date
      t.boolean :admin_approved , :default => false

      t.timestamps null: false
      t.index :sku_id
    end
  end
end
