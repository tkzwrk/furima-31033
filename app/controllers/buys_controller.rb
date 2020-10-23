class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_buy = UserBuy.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_buy = UserBuy.new(buy_params)
    if @user_buy.valid?
      @user_buy.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private
  def buy_params
    params.require(:user_buy).permit(:item_id,:user_id,:postal_code,:area_id,:cities,:add,:bill_name,:phone,:token,:buy_id)
  end
end
