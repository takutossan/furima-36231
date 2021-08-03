class BuyersController < ApplicationController

  def index
  @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
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
