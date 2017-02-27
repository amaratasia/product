# Controller for all products
class ProductsController < ApplicationController
	 skip_before_action :verify_authenticity_token

  def create
  	# product = Product.new(params)
    # product.tags << Tag.find_or_create_by(:name=>"AmarA")
    # Rails.logger.debug params[:images]
    
    # data = {"name"=>"safasdf", "sku_id"=>"e122213w1baqa", "tags_attributes"=>["amar111","23423423"], "images_attributes"=>[{"image_path"=>"http=>//lorempixel.com/200/400/food/"}, {"image_path"=>"http=>//lorempixel.com/200/400/food11/"}]}#product_params
    k = product_params
    # raise k.inspect
    Product.create!(product_params)
    render :json => {status: "data", :product=> "product"}
  end

  def edit
    @product = Product.find(params[:id])
  end

  def remove_tag
    render :json => {status: "data", :product=> "product"}
  end

  def index
    @products = Product.joins("left join images on images.product_id = products.id").select("products.*, images.image_path").group("products.id")
  end

  def update
    @product = Product.includes(:tags).find(params[:id])
    # k = product_params
    @product.update_attributes(product_params)
    redirect_to action: :index
  end

  private

  def product_params
    # params[:tags_attributes] = params[:tags_attributes].values if params.key?(:tags_attributes)
    params[:product][:tags_attributes] = params[:product][:tags].map { |t| {name:  t} } if params[:product].key?(:tags)
    params[:product][:categories_attributes] = params[:product][:categories].map { |t| { name: t } } if params[:product].key?(:categories)
    params[:product][:images_attributes] = params[:product][:images] if params[:product].key?(:images)
    # Rails params.inspect
    params.require(:product).permit(:name, :sku_id, :price, :description, :expire_date, :admin_approved, images_attributes: [:image_path], tags_attributes: [:id, :name, :_destroy], categories_attributes: [:id, :name, :_destroy])
  	# params.require(:product).permit(:name, :sku_id, :price, :description, :expire_date, images_attributes: [:image_path], tags_attributes: [], categories_attributes: [:name])
  end
 
end
