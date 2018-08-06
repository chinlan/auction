require "administrate/base_dashboard"

class FavoriteDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    favorable: Field::Polymorphic,
    favorable_type: Field::Select.with_options(collection: Favorite::FAVORABLE_TYPES),
    favorable_id: Field::Number,
    id: Field::Number,
    created_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :favorable,
    :id,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :favorable,
    :id,
    :created_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :favorable_type,
    :favorable_id
  ].freeze

  # Overwrite this method to customize how favorites are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(favorite)
  #   "Favorite ##{favorite.id}"
  # end
end
