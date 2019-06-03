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

ActiveRecord::Schema.define(version: 20190603075415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "current_weathers", force: :cascade do |t|
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
    t.string "summary"
    t.string "temperature"
    t.string "high_temperature"
    t.string "low_temperature"
    t.string "location_of_request"
    t.string "time"
    t.string "today_forecast"
    t.string "feels_like"
    t.string "humidity"
    t.string "visibility"
    t.string "uv_index"
    t.index ["location_id"], name: "index_current_weathers_on_location_id"
  end

  create_table "forecast_weathers", force: :cascade do |t|
    t.json "forecast_wx_data"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_forecast_weathers_on_location_id"
  end

  create_table "hourly_weathers", force: :cascade do |t|
    t.json "hourly_wx_data"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_hourly_weathers_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "current_weathers", "locations"
  add_foreign_key "forecast_weathers", "locations"
  add_foreign_key "hourly_weathers", "locations"
end
