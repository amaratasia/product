require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'tag_attributes=' do
  	params = {
  		"product"=> {
  			"expire_date" => "2016-09-05",
  			"name"=>"Saffola Oats",
  			"sku_id"=>"SKU_SFO123", 
  			"categories_attributes" => [
  				{"name" => "grocery"},
  				{"name" => "health"}
  			],
  			"tags_attributes"=> [
  				{"name" => "suffola"},
  				{"name" => "oats"},
  				{"name" => "masala"}
  			], 
  			"images_attributes" => [{
				"img_path"=>"http://images-nitrosell-com.akamaized.net/product_images/15/3607/large-saffola%20masala%20oats%20peppytomato-big%20pack.jpg"
			},{
				"img_path"=>"http://foodnetindia.in/wp-content/uploads/2015/09/saffola-masala-oats-classic-masala-40gm-pouch.jpeg"
			}],
  			"price" => 35,
  			"description" => "loaded with goodness of natural wholegrain oatsalong with real vegetables and recherche spices. A great way to start your day.The goodness of the product lies in its ingredients!"
  			}
  		}
		product = Product.new(params["product"])
		product.save
		assert_equal product.tags.size, 3
		assert_equal product.tags.first.name, "suffola"
		assert_equal product.categories.size, 2
		assert_equal product.categories.first.name, "grocery"
		assert_equal product.images.size, 2
  end
end
