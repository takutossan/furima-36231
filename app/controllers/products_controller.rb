class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_confirmation, only: [:edit, :update, :destroy]
  
  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :message, :category_id, :price, :item_status_id, :shipping_cost_id,:shipper_id, :shipping_date_id, :user).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_confirmation 
    unless current_user.id == @product.user.id
      redirect_to root_path
   end
  end
end