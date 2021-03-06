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

ActiveRecord::Schema.define(version: 20141130144519) do

  create_table "common_spaces", force: true do |t|
    t.float    "value"
    t.date     "start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "needed_assessory_charges", force: true do |t|
    t.float    "value"
    t.date     "start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "needed_basic_rents", force: true do |t|
    t.float    "value"
    t.date     "start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "needed_heating_charges", force: true do |t|
    t.float    "value"
    t.date     "start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rentable_rooms", force: true do |t|
    t.integer  "value"
    t.date     "start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rented_rooms", force: true do |t|
    t.integer  "room_id"
    t.integer  "rent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rented_rooms", ["rent_id"], name: "index_rented_rooms_on_rent_id"
  add_index "rented_rooms", ["room_id"], name: "index_rented_rooms_on_room_id"

  create_table "rents", force: true do |t|
    t.date     "start"
    t.float    "basic_rent"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "custom_heating"
    t.float    "custom_assessory"
    t.string   "comment"
    t.integer  "commons_share",        default: 1
    t.boolean  "is_office",            default: false
    t.integer  "rent_id"
    t.integer  "previous_contract_id"
  end

  add_index "rents", ["tenant_id"], name: "index_rents_on_tenant_id"

  create_table "rooms", force: true do |t|
    t.integer  "number"
    t.string   "house"
    t.string   "floor_short"
    t.string   "features"
    t.integer  "square_meters"
    t.text     "security_hint"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenants", force: true do |t|
    t.string   "prename"
    t.string   "name"
    t.string   "current_street_no"
    t.string   "current_zip_code_city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "total_square_meters", force: true do |t|
    t.integer  "value"
    t.date     "start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
