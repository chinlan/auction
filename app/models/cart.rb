class Cart < ApplicationRecord
  include Uidable
  uidable scope: true, set_to_param: true
  belongs_to :buyer, class_name: 'User', foreign_key: :user_id
  has_one :order
  has_many :line_items
  has_many :products, through: :line_items

  def total_price
    line_items.inject(0) { |sum, item| sum + item.price * item.number }
  end
end
