# Stores Images for Products
class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :img_path
      t.string :product_id
    end
  end
end
