class CreateProductCategoryMapping < ActiveRecord::Migration
	def change
		create_table :products_categories_mapping, id: false do |t|
			t.belongs_to :product, index: true
			t.belongs_to :category, index: true
		end
	end
end
