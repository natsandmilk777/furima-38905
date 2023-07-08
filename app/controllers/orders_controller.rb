class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    # @item_stock = ItemOrder.find(params[:item_id])
    if user_signed_in? && current_user.id != @item.user_id && @item.order == nil
      @item_order = ItemOrder.new
    else
      redirect_to root_path
    end
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      return redirect_to root_path
    else
      render action: :index
    end
  end
end
