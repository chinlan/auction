class Product < ApplicationRecord
  extend Enumerize
  include Favorable

  enumerize :status, in: { draft: 0, published: 1 },
            default: :draft, scope: true

  validates :name, presence: true
  validates :price, presence: true

  belongs_to :seller, class_name: 'User', foreign_key: :user_id

  delegate :email, to: :seller, prefix: 'seller'
end
