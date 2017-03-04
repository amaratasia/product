# Controller for all products
class Admin::ProductsController < ApplicationController
  def create
    product = Product.create(product_params)
    if product.save
      render :json => {status: "success", :message=> "Product Successfully Created"}, :status => 200
    else
      render :json => {status: "success", :message => @product.errors.messages}, :status => 422
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  def index
    @products = Product.joins("left join images on images.product_id = products.id").select("products.*, images.img_path img").group("products.id")
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to action: :index
    end
  end

  private

  def product_params
    #params.merge!(data_formating(params)) if concern used
    params[:product][:tags_attributes] = params[:product][:tags].map { |t| {name:  t} } if params[:product].key?(:tags)
    params[:product][:categories_attributes] = params[:product][:categories].map { |t| { name: t } } if params[:product].key?(:categories)
    params[:product][:images_attributes] = params[:product][:images] if params[:product].key?(:images)

    #Do not Whitelist Admin approved for Create Calls.
    return params.require(:product).permit(:name, :sku_id, :price, :description, :expire_date, images_attributes: [:img_path], tags_attributes: [:id, :name, :_destroy], categories_attributes: [:id, :name, :_destroy]) if (params[:action] == "create")

    return params.require(:product).permit(:name, :sku_id, :price, :description, :expire_date, :admin_approved, images_attributes: [:img_path], tags_attributes: [:id, :name, :_destroy], categories_attributes: [:id, :name, :_destroy])
  end
end
