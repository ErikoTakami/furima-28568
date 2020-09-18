class PurchasesController < ApplicationController
  before_action :authenticate_user! 
  before_action :item_find, only:[:index, :create, :pay_item, :user_check, :sold_check]
  before_action :user_check
  before_action :sold_check

  def index 
    @purchase = ItemPurchase.new
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def user_check
      if user_signed_in? && current_user.id == @item.user_id
        redirect_to root_path
      end
  end

  def sold_check
    if Purchase.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

end
