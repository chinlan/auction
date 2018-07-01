class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.references :cart, null: false
      t.references :order
      t.references :product, null: false
      t.integer :quantity, null: false, default: 1

      t.datetime :created_at, null: false
    end
  end
end
