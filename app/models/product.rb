# Class for Products
class Product < ActiveRecord::Base
  has_many :images
  has_and_belongs_to_many :categories,
   :join_table => :products_categories_mapping
  has_and_belongs_to_many :tags,
   :join_table => :products_tags_mapping
  validates :sku_id, :uniqueness => { "case_sensitive" => false }
  validates :name, presence: true
  accepts_nested_attributes_for :tags, :images, :categories

  def image
    self.images.first.try(:img_path)
  end

  def tags_attributes=(tags_attributes)
    tags_attributes.each do |tag_attributes|
      if tag_attributes["name"].present?
        if (tag_attributes["_destroy"] == "1")
          self.tags.delete(tag_attributes["id"])
        else
          tag_attributes.delete("_destroy")
          new_tag = Tag.find_or_create_by(:name =>tag_attributes["name"])
          self.tags << new_tag unless new_tag.in? self.tags
        end
      end
    end
  end
  def categories_attributes=(categories_attributes)
    categories_attributes.each do |category_attributes|
      if category_attributes["name"].present?
        if (category_attributes["_destroy"] == "1") 
          self.categories.delete(category_attributes["id"])
        else
          new_category = Category.find_or_create_by(:name =>category_attributes["name"])
          self.categories << new_category unless new_category.in? self.categories
        end
      end
    end
  end
end