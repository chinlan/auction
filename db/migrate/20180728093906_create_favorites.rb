class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false
      t.integer :favorable_id, null: false
      t.string :favorable_type, null: false
      t.datetime :created_at, null: false
    end
    add_index :favorites, [:favorable_type, :favorable_id]
    add_index :favorites, [:user_id, :favorable_type, :favorable_id], unique: true
  end
end
