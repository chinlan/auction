class User < ApplicationRecord
  include Favorable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  has_many :orders
  has_many :orders_users
  has_many :sales_orders, through: :orders_users, source: :order
  has_one :cart
  has_many :favorites
  has_many :favorite_sellers, through: :favorites,
           source: :favorable, source_type: 'User'
  has_many :favorite_products, through: :favorites,
           source: :favorable, source_type: 'Product'
end
