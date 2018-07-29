module Favorable
  extend ActiveSupport::Concern

  included do
    has_many :favorites, as: :favorable
    has_many :fans, through: :favorites, source: :user
  end
end
