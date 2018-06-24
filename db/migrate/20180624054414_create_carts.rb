class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :uid, null: false
      t.references :user, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
