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

ActiveRecord::Schema.define(version: 20181216071539) do

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

  create_table "dishes", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "price",                     null: false
    t.integer  "calorie",                   null: false
    t.integer  "category",                  null: false
    t.boolean  "potential",  default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
