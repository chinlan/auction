require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    favorites: Field::HasMany,
    fans: Field::HasMany.with_options(class_name: "User"),
    seller: Field::BelongsTo.with_options(class_name: "User", foreign_key: :user_id),
    # images_attachments: Field::HasMany.with_options(class_name: "ActiveStorage::Attachment"),
    # images_blobs: Field::HasMany.with_options(class_name: "ActiveStorage::Blob"),
    id: Field::Number,
    # user_id: Field::Number,
    name: Field::String,
    description: Field::Text,
    price: Field::String.with_options(searchable: false),
    status: Field::Select.with_options(collection: Product.status.values),
    quantity: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :favorites,
    :fans,
    :seller,
    # :images_attachments,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :favorites,
    :fans,
    :seller,
    # :images_attachments,
    # :images_blobs,
    :id,
    # :user_id,
    :name,
    :description,
    :price,
    :status,
    :quantity,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :favorites,
    :fans,
    :seller,
    # :images_attachments,
    # :images_blobs,
    # :user_id,
    :name,
    :description,
    :price,
    :status,
    :quantity,
  ].freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product)
  #   "Product ##{product.id}"
  # end
end
