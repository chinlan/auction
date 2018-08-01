class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :imageable_id, null: false
      t.string :imageable_type, null: false
      t.string :image, null: false
      t.string :original_filename
      t.string :content_type
      t.datetime :created_at, null: false
    end
    add_index :images, %i[imageable_type imageable_id]
  end
end
