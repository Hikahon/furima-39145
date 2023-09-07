class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
       @order.save(params, current_user.id)
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city,
      :street_address, :building, :phone_number, :buyer).merge(item_id: params[:item_id], user_id: current_user.id )
  end
end
