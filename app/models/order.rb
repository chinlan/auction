class Order < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: :user_id
  has_many :line_items
  has_many :orders_users
  has_many :sellers, through: :orders_users, source: :seller
  delegate :seller_profit, to: :orders_user
  after_save do
    buyer.cart.destroy!
  end
end
