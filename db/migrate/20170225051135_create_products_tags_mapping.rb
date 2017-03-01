class CreateProductsTagsMapping < ActiveRecord::Migration
	def change
		create_table :products_tags_mapping do |t|
			t.belongs_to :product, index: true
			t.belongs_to :tag, index: true
		end
	end
end
