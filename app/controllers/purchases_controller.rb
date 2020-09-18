class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = ItemPurchase.new
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
    @item = Item.find(params[:item_id])

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

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
