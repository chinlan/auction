class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def create
    @line_item = @cart.line_items.find_or_initialize_by(product_id: params.dig(:line_item, :product_id))
    if @line_item.new_record?
      @line_item.save!
    else
      @line_item.increment!(:number)
    end
  end

  def update
    @line_item = @cart.line_items.find(params[:id])
    @line_item.update_attributes(line_item_params)
    @line_items = @cart.line_items
  end

  def destroy
    @line_item = @cart.line_items.find(params[:id])
    @line_item.destroy
    @line_items = @cart.line_items
  end

  private

  def set_cart
    @cart = Cart.find_or_create_by(user_id: current_user.id)
  end

  def line_item_params
    params.require(:line_item).permit(:number, :product_id)
  end
end
