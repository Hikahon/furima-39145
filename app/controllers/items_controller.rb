class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
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

  def show
  end

  def edit
    return unless @item.buyer.present?

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    return unless @item.destroy

    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name, :description, :image, :category_id, :state_id, :shipping_fee_id, :prefecture_id, :shipping_duration_id, :price
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    return unless @item.user != current_user

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
