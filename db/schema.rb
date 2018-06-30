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

ActiveRecord::Schema.define(version: 20180624060815) do

  create_table "carts", force: :cascade do |t|
    t.string   "uid",        null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "cart_id",                null: false
    t.integer  "product_id",             null: false
    t.integer  "number",     default: 1, null: false
    t.datetime "created_at",             null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "uid",                                   null: false
    t.integer  "user_id",                               null: false
    t.decimal  "total_profit", precision: 15, scale: 5
    t.decimal  "site_profit",  precision: 15, scale: 5
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_users", force: :cascade do |t|
    t.integer  "order_id",                               null: false
    t.integer  "user_id",                                null: false
    t.decimal  "seller_profit", precision: 15, scale: 5
    t.datetime "created_at",                             null: false
    t.index ["order_id"], name: "index_orders_users_on_order_id"
    t.index ["user_id"], name: "index_orders_users_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "uid",                                                  null: false
    t.integer  "user_id",                                              null: false
    t.string   "name",                                                 null: false
    t.text     "description"
    t.decimal  "price",       precision: 15, scale: 5, default: "0.0", null: false
    t.integer  "status",                               default: 0,     null: false
    t.integer  "number",                               default: 0,     null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.index ["user_id"], name: "index_products_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
