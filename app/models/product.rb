class Product < ApplicationRecord
  extend Enumerize
  include Favorable
  # searchkick mappings {
  #   product: {
  #     properties: {
  #       description: { type: 'string', norms: { enabled: false } }
  #     }
  #   }
  # }
  searchkick callbacks: :async

  enumerize :status, in: { draft: 0, published: 1 },
            default: :draft, scope: true

  validates :name, presence: true
  validates :price, presence: true

  belongs_to :seller, class_name: 'User', foreign_key: :user_id
  has_many_attached :images

  delegate :email, to: :seller, prefix: 'seller'

  after_save { Product.reindex }

  # def should_index?
  #   status == 'published'
  # end

  def search_data
    {
      name: name,
      description: description,
      status: status
    }
  end
end
