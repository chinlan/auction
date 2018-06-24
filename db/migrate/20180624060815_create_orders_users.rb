class CreateOrdersUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_users do |t|
      t.references :order, null: false
      t.references :user, null: false
      t.float :seller_profit
      t.datetime :created_at, null: false
    end
  end
end
