class CreateProductCategoryMapping < ActiveRecord::Migration
  def change
    create_table :products_category_mappings do |t|
      t.integer :product_id
      t.integer :category_id
    end
  end
end
