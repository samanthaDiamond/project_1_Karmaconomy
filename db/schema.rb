# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160427210613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deeds", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.text     "date"
    t.text     "image"
    t.text     "deed_type"
    t.integer  "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "karma"
    t.integer  "category_id"
  end

  add_index "deeds", ["category_id"], name: "index_deeds_on_category_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "deed_id"
    t.integer  "karma"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "accept_id"
    t.boolean  "complete"
  end

  add_index "orders", ["deed_id"], name: "index_orders_on_deed_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "username"
    t.integer  "postcode"
    t.text     "biography"
    t.text     "image"
    t.integer  "karma"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

end
