class Order < ApplicationRecord
  include Uidable
  uidable scope: true, set_to_param: true
  belongs_to :buyer, class_name: 'User', foreign_key: :user_id
  has_many :line_items
  has_many :orders_users
  has_many :sellers, through: :orders_users, source: :user, foreign_key: :user_id
  delegate :seller_profit, to: :orders_user
  after_save do
    buyer.cart.destroy!
  end
end
