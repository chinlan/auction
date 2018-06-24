class Order < ApplicationRecord
  include Uidable
  uidable scope: true, set_to_param: true
  belongs_to :buyer, class_name: 'User', foreign_key: :user_id
  belongs_to :cart
end
