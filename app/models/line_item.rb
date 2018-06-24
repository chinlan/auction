class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  delegate :name, to: :product, prefix: 'product'
  delegate :price, to: :product

  def product_price
    price * number
  end
end
