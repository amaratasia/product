class CreateProductsTagsMapping < ActiveRecord::Migration
  def change
    create_table :products_tags_mapping do |t|
    	t.integer :product_id
      t.integer :tag_id
    end
  end
end
