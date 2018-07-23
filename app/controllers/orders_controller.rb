class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = OrderCreator.new(current_user).call
    if @order
      redirect_to my_order_path(@order)
    else
      flash[:error] = current_user.cart.errors.full_messages.first
      redirect_to my_cart_path
    end
  end
end
