class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :uid, null: false
      t.references :user, null: false
      t.string :name, null: false
      t.text :description
      t.decimal :price, null: false, default: 0.0, precision: 15, scale: 5
      t.integer :status, null: false, default: 0
      t.integer :quantity, null: false, default: 0
      t.timestamps
    end
  end
end
