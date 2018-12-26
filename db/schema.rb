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

ActiveRecord::Schema.define(version: 20181226141007) do

  create_table "allergies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "allergy_dishes", force: :cascade do |t|
    t.integer  "allergy_id", null: false
    t.integer  "dish_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "allergy_dishes", ["allergy_id"], name: "index_allergy_dishes_on_allergy_id"
  add_index "allergy_dishes", ["dish_id"], name: "index_allergy_dishes_on_dish_id"

  create_table "box_dishes", force: :cascade do |t|
    t.integer  "box_id",     null: false
    t.integer  "dish_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "box_kinds", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "capacity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boxes", force: :cascade do |t|
    t.integer  "box_kind_id", null: false
    t.integer  "order_id",    null: false
    t.integer  "rice",        null: false
    t.integer  "number",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "boxes", ["box_kind_id"], name: "index_boxes_on_box_kind_id"
  add_index "boxes", ["order_id"], name: "index_boxes_on_order_id"

  create_table "customers", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "telephone",       null: false
    t.string   "mail_address",    null: false
    t.string   "username",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "hashed_password"
  end

  create_table "dish_images", force: :cascade do |t|
    t.integer  "dish_id",      null: false
    t.binary   "data",         null: false
    t.string   "content_type", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "price",                     null: false
    t.integer  "calorie",                   null: false
    t.integer  "category",                  null: false
    t.boolean  "potential",  default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id",                 null: false
    t.boolean  "status",      default: false, null: false
    t.datetime "time",                        null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"

  create_table "sale_managements", force: :cascade do |t|
    t.integer  "dish_id",                    null: false
    t.integer  "planned_number", default: 0, null: false
    t.integer  "made_number",    default: 0, null: false
    t.integer  "sold_number",    default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string   "name",                            null: false
    t.boolean  "admin",           default: false, null: false
    t.string   "username",                        null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "hashed_password"
  end

end
