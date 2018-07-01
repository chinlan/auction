class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.purchase
    if @order
      redirect_to my_order_path(@order)
    else
      flash[:error] = current_user.cart.errors.full_messages
      redirect_to cart_path
    end
  end
end
