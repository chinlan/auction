class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def create
    product = Product.with_uid(params.dig(:line_item, :product_uid)).take
    @line_item = @cart.line_items.find_or_initialize_by(product_id: product.id)
    if @line_item.new_record?
      @line_item.save!(line_item_params)
    else
      @line_item.update!(quantity: @line_item.quantity + params.dig(:line_item, :quantity).to_i)
    end
  end

  def update
    authorize @cart
    @line_item = @cart.line_items.find(params[:id])
    @line_items = @cart.line_items
    @line_item.update_attributes(line_item_params)
  end

  def destroy
    authorize @cart
    @line_item = @cart.line_items.find(params[:id])
    @line_item.destroy
    @line_items = @cart.line_items
  end

  private

  def set_cart
    @cart = Cart.find_or_create_by(user_id: current_user.id)
  end

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_uid)
  end
end
