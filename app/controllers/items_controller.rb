class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show, :search]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :image, :category_id, :condition_id, :charge_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
