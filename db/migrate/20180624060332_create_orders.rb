class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false
      t.decimal :total_profit, precision: 15, scale: 5
      t.decimal :site_profit, precision: 15, scale: 5

      t.timestamps
    end
  end
end
