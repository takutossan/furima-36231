class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
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
  end

  private
  def product_params
    params.require(:product).permit(:name, :image, :message, :category_id, :price, :item_status_id, :shipping_cost_id, :shipper_id, :shipping_date_id, :user).merge(user_id: current_user.id)
  end
end
