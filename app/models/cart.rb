class Cart < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: :user_id
  has_one :order
  has_many :line_items
  has_many :products, through: :line_items

  def total_price
    line_items.inject(0) { |sum, item| sum + item.price * item.quantity }
  end
end
