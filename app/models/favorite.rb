class Favorite < ApplicationRecord
  FAVORABLE_TYPES = %w[User Product]

  belongs_to :user
  belongs_to :favorable, polymorphic: true

  validates :favorable_type, inclusion: { in: FAVORABLE_TYPES }
end
