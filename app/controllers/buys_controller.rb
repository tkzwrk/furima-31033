class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :set_soldout
  before_action :set_user_buy

  def index
    @buy_delivery = BuyDelivery.new
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def buy_params
    params.require(:buy_delivery).permit(:item_id,:user_id,:postal_code,:area_id,:cities,:add,:bill_name,:phone,:buy_id).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: buy_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_soldout
    if @item.buy.present?
      redirect_to root_path
    end
  end

  def set_user_buy
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
