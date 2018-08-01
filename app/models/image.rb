class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validates :imageable_type, inclusion: { in: %w[User Product] }
end
