# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180728093906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "favorable_id",   null: false
    t.string   "favorable_type", null: false
    t.datetime "created_at",     null: false
    t.index ["favorable_type", "favorable_id"], name: "index_favorites_on_favorable_type_and_favorable_id", using: :btree
    t.index ["user_id", "favorable_type", "favorable_id"], name: "index_favorites_on_user_id_and_favorable_type_and_favorable_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "cart_id",                null: false
    t.integer  "order_id"
    t.integer  "product_id",             null: false
    t.integer  "quantity",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
    t.index ["order_id"], name: "index_line_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_line_items_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "uid",                                   null: false
    t.integer  "user_id",                               null: false
    t.decimal  "total_profit", precision: 15, scale: 5
    t.decimal  "site_profit",  precision: 15, scale: 5
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "orders_users", force: :cascade do |t|
    t.integer  "order_id",                               null: false
    t.integer  "user_id",                                null: false
    t.decimal  "seller_profit", precision: 15, scale: 5
    t.datetime "created_at",                             null: false
    t.index ["order_id"], name: "index_orders_users_on_order_id", using: :btree
    t.index ["user_id"], name: "index_orders_users_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "uid",                                                  null: false
    t.integer  "user_id",                                              null: false
    t.string   "name",                                                 null: false
    t.text     "description"
    t.decimal  "price",       precision: 15, scale: 5, default: "0.0", null: false
    t.integer  "status",                               default: 0,     null: false
    t.integer  "quantity",                             default: 0,     null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                           default: "",        null: false
    t.string   "encrypted_password",                              default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                   default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.decimal  "points",                 precision: 15, scale: 5, default: "10000.0", null: false
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
