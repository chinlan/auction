class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  delegate :name, to: :product, prefix: 'product'
  delegate :price, to: :product
  attr_accessor :product_uid

  def product_price
    price * number
  end
end
