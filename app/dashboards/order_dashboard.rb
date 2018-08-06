require "administrate/base_dashboard"

class OrderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    buyer: Field::BelongsTo.with_options(class_name: "User", foreign_key: :user_id),
    line_items: Field::HasMany,
    orders_users: Field::HasMany,
    sellers: Field::HasMany.with_options(class_name: "User"),
    id: Field::Number,
    user_id: Field::Number,
    total_profit: Field::String.with_options(searchable: false),
    site_profit: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :buyer,
    :line_items,
    :orders_users,
    :sellers,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :buyer,
    :line_items,
    :orders_users,
    :sellers,
    :id,
    :user_id,
    :total_profit,
    :site_profit,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :buyer,
    :line_items,
    :orders_users,
    :sellers,
    :user_id,
    :total_profit,
    :site_profit,
  ].freeze

  # Overwrite this method to customize how orders are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order)
  #   "Order ##{order.id}"
  # end
end
