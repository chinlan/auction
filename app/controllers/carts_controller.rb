class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
    @line_items = @cart&.line_items
  end

  # def create
  #   cart = Cart.find_or_create_by(user_id: current_user.id)
  #   product = Product.with_uid(params[:product_uid]).take
  #   # item = cart.line_items.find(product_id: product.id)
  #   # if item.present?
  #   #   item.increment!(:number)
  #   # else
  #   #   cart.line_items.create(product_id: product.id)
  #   # end
  #   item = cart.line_items.find_or_initialize_by(product_id: product.id)
  #   if item.new_record?
  #     item.save!
  #   else
  #     item.increment!(:number)
  #   end
  #   redirect_to cart_path
  # end

  # def update
  #   @cart = current_user.cart
  #   if @cart.update(cart_params)
  #     redirect_to cart_path
  #   else
  #     render :show
  #   end
  # end

  # private

  # def cart_params
  #   params.require(:cart).permit(line_items_attributes: [:id, :number, :_destroy])
  # end

end
