class BuyersController < ApplicationController

  def index
  @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      Payjp.api_key = "sk_test_6e7b6598a03a879f110affd8"  
      Payjp::Charge.create(
        amount: buyer_params[:price],
        card: buyer_params[:token],
        currency: 'jpy'
      )
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:zip_code, :shipper_id, :municipalities, :street_number, :telephone_number, :building).merge(user_id: current_user.id)
  end

end
