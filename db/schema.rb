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

ActiveRecord::Schema.define(version: 20131227082505) do

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

end
