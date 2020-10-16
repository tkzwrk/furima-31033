class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show, :search]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    # unless user_signed_in?
    #   redirect_to  new_user_session_path
    # end
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:title,:text,:image,:category_id,:condition_id,:charge_id,:prefectures_id,:area_id,:day_id,:price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
