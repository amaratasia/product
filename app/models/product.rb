# Class for Products
class Product < ActiveRecord::Base
  has_many :tags
  has_many :images
  has_and_belongs_to_many :categories,
   :join_table => :products_categories_mapping
  has_and_belongs_to_many :tags,
   :join_table => :products_tags_mapping
  validates :sku_id, :uniqueness => { "case_sensitive" => false }
  validates :name, presence: true
  accepts_nested_attributes_for :tags, :images, :categories

  # attr_accessor :name
  # attr_accessor :name
  # Product.create(:expire_date=> Time.now + 5.days, :name=>"Suffola Oats", :sku_id=>"SKU_SFO123", :price => 35, :description => "loaded with goodness of natural wholegrain oats along with real vegetables and recherché spices. A great way to start your day. The goodness of the product lies in its ingredients!")

  def create_from_product_data(params)
    images = eval params["images"]
    Rails.logger.debug images
    if images
      images.each do |img|
        Image.create(:image_path=>img[:img_path], :product_id=> self.id)
      end
    end
  end
end
