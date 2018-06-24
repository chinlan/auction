class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :uid, null: false
      t.references :user, null: false
      t.float :total_profit
      t.float :site_profit
      t.references :cart, null: false

      t.timestamps
    end
  end
end
