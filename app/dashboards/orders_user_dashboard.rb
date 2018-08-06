require "administrate/base_dashboard"

class OrdersUserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    seller: Field::BelongsTo.with_options(class_name: "User"),
    order: Field::BelongsTo,
    id: Field::Number,
    user_id: Field::Number,
    seller_profit: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :seller,
    :order,
    :id,
    :user_id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :seller,
    :order,
    :id,
    :user_id,
    :seller_profit,
    :created_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :seller,
    :order,
    :user_id,
    :seller_profit,
  ].freeze

  # Overwrite this method to customize how orders users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(orders_user)
  #   "OrdersUser ##{orders_user.id}"
  # end
end
