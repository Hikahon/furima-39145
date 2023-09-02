class ItemsController < ApplicationController
  def index
  end

  def new
  end
  
  def create_table
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :image).merge(user_id: current_user.id)
  end
end
