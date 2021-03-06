# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_06_023849) do

  create_table "etl_meta", force: :cascade do |t|
    t.datetime "last_runtime"
    t.integer "etl_version"
    t.string "etl_record_type"
    t.integer "etl_record_id"
    t.index ["etl_record_type", "etl_record_id"], name: "index_etl_meta_on_etl_record_type_and_etl_record_id"
  end

  create_table "plants", force: :cascade do |t|
    t.integer "days_to_harvest"
    t.decimal "ph_maximum"
    t.decimal "ph_minimum"
    t.integer "prefered_light"
    t.decimal "prefered_atmospheric_humidity"
    t.integer "row_spacing"
    t.integer "spread"
    t.string "minimum_root_depth"
    t.decimal "prefered_sand_vs_clay_silt"
    t.decimal "prefered_nutrients"
    t.string "prefered_soil_humidity"
    t.boolean "nitrogen_fixation"
    t.string "average_height"
    t.decimal "minimum_tempurature"
    t.decimal "maximum_temperature"
    t.string "slug"
    t.string "common_name"
    t.string "image_url"
    t.integer "fruit_months", default: 0, null: false
    t.integer "growth_months", default: 0, null: false
    t.decimal "maximum_precipitation"
    t.decimal "minimum_precipitation"
    t.decimal "maximum_soil_salinity"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.string "perishable_token"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
