# Controller for all products
class ProductsController < ApplicationController
	 skip_before_action :verify_authenticity_token

  def create
  	# product = Product.new(params)
    # product.tags << Tag.find_or_create_by(:name=>"AmarA")
    Rails.logger.debug params[:images]
    
    data = {"name"=>"safasdf", "sku_id"=>"e122213w1baqa", "tags_attributes"=>["amar111","23423423"], "images_attributes"=>[{"image_path"=>"http=>//lorempixel.com/200/400/food/"}, {"image_path"=>"http=>//lorempixel.com/200/400/food11/"}]}#product_params

    product = Product.create!(product_params)
    if product
    	# product.create_from_product_data(params.to_hash)
    end
    # if( params[:tags] && product)
    # 	(params[:tags].split(",")).each do |tag|
	   #  	product.tags << Tag.find_or_create_by(:name=>tag)
	   #  end
    # end
    render :json => {status: data, :product=> product}
  end

  def edit
    @product = Product.find(params[:id])
    
  end

  def index
    @products = Product.joins("left join images on images.product_id = products.id").select("products.*, images.image_path").group("products.id")
    Rails.logger.debug "amar  -- #{@products.first.inspect}"
  end

  private

  def product_params
    params[:tags_attributes] = params[:tags].map { |t| find_or_create_by(name: t) } if params.key?(:tags)
    params[:categories_attributes] = params[:categories].map { |t| { name: t } } if params.key?(:categories)
  	params.permit(:name, :sku_id, :price, :description, :expire_date, images_attributes: [:image_path], tags_attributes: [:name], categories_attributes: [:name])
  end
end
