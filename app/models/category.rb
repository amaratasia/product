class Category < ActiveRecord::Base
	validates :name, presence: true
	#  Category.create(name: :Shirt)
	has_and_belongs_to_many :products, :join_table=>:products_categories_mapping
end
