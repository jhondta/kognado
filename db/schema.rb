# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_09_165711) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "common_name", limit: 100, null: false
    t.string "official_name", limit: 100, null: false
    t.string "iso_code2", limit: 2, null: false
    t.string "iso_code3", limit: 3, null: false
    t.string "phone_code", limit: 5, null: false
    t.string "tld", limit: 5, null: false
    t.string "flag", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["common_name"], name: "index_countries_on_common_name", unique: true
    t.index ["iso_code2"], name: "index_countries_on_iso_code2", unique: true
    t.index ["iso_code3"], name: "index_countries_on_iso_code3", unique: true
    t.index ["official_name"], name: "index_countries_on_official_name", unique: true
  end

  create_table "country_currencies", id: false, force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "currency_id", null: false
    t.boolean "is_primary", default: false, null: false
    t.index ["country_id", "currency_id"], name: "index_country_currencies_on_country_id_and_currency_id", unique: true
    t.index ["country_id"], name: "index_country_currencies_on_country_id"
    t.index ["currency_id"], name: "index_country_currencies_on_currency_id"
  end

  create_table "country_languages", id: false, force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "language_id", null: false
    t.boolean "is_primary", default: false, null: false
    t.index ["country_id", "language_id"], name: "index_country_languages_on_country_id_and_language_id", unique: true
    t.index ["country_id"], name: "index_country_languages_on_country_id"
    t.index ["language_id"], name: "index_country_languages_on_language_id"
  end

  create_table "country_timezones", id: false, force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "timezone_id", null: false
    t.boolean "is_primary", default: false, null: false
    t.index ["country_id", "timezone_id"], name: "index_country_timezones_on_country_id_and_timezone_id", unique: true
    t.index ["country_id"], name: "index_country_timezones_on_country_id"
    t.index ["timezone_id"], name: "index_country_timezones_on_timezone_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "iso_code", limit: 3, null: false
    t.string "symbol", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iso_code"], name: "index_currencies_on_iso_code", unique: true
    t.index ["name"], name: "index_currencies_on_name", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "iso_code2", limit: 2, null: false
    t.string "iso_code3", limit: 3, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iso_code2"], name: "index_languages_on_iso_code2", unique: true
    t.index ["iso_code3"], name: "index_languages_on_iso_code3", unique: true
    t.index ["name"], name: "index_languages_on_name", unique: true
  end

  create_table "timezones", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.decimal "gmt_offset", precision: 3, scale: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_timezones_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "country_currencies", "countries"
  add_foreign_key "country_currencies", "currencies"
  add_foreign_key "country_languages", "countries"
  add_foreign_key "country_languages", "languages"
  add_foreign_key "country_timezones", "countries"
  add_foreign_key "country_timezones", "timezones"
end
