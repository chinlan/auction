class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :uid, null: false
      t.references :user, null: false
      t.string :name, null: false
      t.text :description
      t.integer :price, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.integer :number, null: false, default: 0
      t.timestamps
    end
  end
end
