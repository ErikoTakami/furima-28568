class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category, :status, :shipping_charges, :shipping_origin, :days_until_shipping, :price, :image).merge(user_id: current_user.id)
  end
end
