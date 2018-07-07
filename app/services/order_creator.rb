class OrderCreator

  class UnpurchasableError < StandardError; end

  def initialize(user)
    @user = user
    @cart = @user.cart
  end

  def call
    Order.transaction do
      calculate_line_item
      create_order
      calculate_buyer_point
    end
    @order
  rescue ActiveRecord::RecordInvalid, UnpurchasableError => e
    @cart.errors.add(:order_creator_fail, e.message)
    nil
  end

  private

  def calculate_line_item
    @cart.line_items.each do |item|
      raise UnpurchasableError.new, "No enough #{item.product_name}, there is only #{item.product_quantity} left" if item.product_quantity < item.quantity
      item.product.update!(quantity: item.product_quantity - item.quantity)
    end
  end

  def create_order
    site_profit = @cart.total_price * 0.1
    @order = @user.orders.create!(total_profit: @cart.total_price, site_profit: site_profit)
    @cart.line_items.each do |item|
      item.update!(order_id: @order.id)
      seller_profit = item.sum_price * 0.9
      @order.orders_users.create!(user_id: item.user_id, seller_profit: seller_profit)
      calculate_seller_point(item.user_id, seller_profit)
    end
  end

  def calculate_buyer_point
    amount = @user.points - @cart.total_price
    @user.update!(points: amount)
  end

  def calculate_seller_point(user_id, seller_profit)
    user = User.find user_id
    user.update!(points: user.points + seller_profit)
  end
end
