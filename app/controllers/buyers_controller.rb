class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_product, only: [:index, :create]
  before_action :set_confirmation, only: [:index, :create]
  #before_action :sold_out_product, only: [:index] 後で必要になるかもしれないのでこのままでお願いします。

  def index
  @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(
      :zip_code, :shipper_id, :municipalities, :street_number, :telephone_number, :building).merge(product_id: @product.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,
        card: buyer_params[:token],
        currency: 'jpy'
      )
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_confirmation 
      if current_user.id == @product.user.id || @product.buyer.present?
        redirect_to root_path
     end
    end

  #def sold_out_product 後で必要になるかもしれないのでこのままでお願いします。
    #if @product.buyer.present?
    #redirect_to root_path
  #end
 #end
end
