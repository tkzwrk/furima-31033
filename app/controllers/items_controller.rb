class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title,:text,:image,:category_id,:condition_id,:charge_id,:prefectures_id,:area_id,:days_id,:price).merge(user_id: current_user.id)
  end
end
