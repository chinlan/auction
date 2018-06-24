class OrdersUser < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: :user_id
  belongs_to :order
end
