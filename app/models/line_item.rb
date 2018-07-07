class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order, optional: true
  delegate :name, to: :product, prefix: 'product'
  delegate :price, to: :product
  delegate :quantity, to: :product, prefix: 'product'
  delegate :user_id, to: :product
  attr_accessor :product_uid

  validate :enough_quantity, if: -> { order_id == nil }

  def enough_quantity
    return unless quantity > product_quantity
    self.errors.add(:quantity,
      "No enough #{product_name}, there is only #{product_quantity} left")
  end

  def sum_price
    price * quantity
  end
end
