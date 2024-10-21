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

ActiveRecord::Schema[7.2].define(version: 2024_10_21_082934) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "common_name", limit: 100, null: false
    t.string "official_name", limit: 100, null: false
    t.string "iso_code2", limit: 2, null: false
    t.string "iso_code3", limit: 3, null: false
    t.string "phone_code", limit: 10, null: false
    t.string "tld", limit: 5, null: false
    t.text "flag_svg", null: false
    t.binary "flag_png", null: false
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

  create_table "inventory_categories", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "description", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_inventory_categories_on_name", unique: true
  end

  create_table "inventory_item_categories", force: :cascade do |t|
    t.bigint "inventory_item_id", null: false
    t.bigint "inventory_category_id", null: false
    t.index ["inventory_category_id"], name: "index_inventory_item_categories_on_inventory_category_id"
    t.index ["inventory_item_id", "inventory_category_id"], name: "idx_on_inventory_item_id_inventory_category_id_7c7e8d6305", unique: true
    t.index ["inventory_item_id"], name: "index_inventory_item_categories_on_inventory_item_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "sku", limit: 100, null: false
    t.text "description", null: false
    t.bigint "measure_unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["measure_unit_id"], name: "index_inventory_items_on_measure_unit_id"
    t.index ["name"], name: "index_inventory_items_on_name"
    t.index ["sku"], name: "index_inventory_items_on_sku", unique: true
  end

  create_table "inventory_stocks", force: :cascade do |t|
    t.bigint "inventory_item_id", null: false
    t.bigint "inventory_warehouse_id", null: false
    t.integer "quantity", default: 0, null: false
    t.integer "minimum", default: 0, null: false
    t.integer "maximum", default: 0, null: false
    t.integer "reorder_quantity", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_item_id", "inventory_warehouse_id"], name: "idx_on_inventory_item_id_inventory_warehouse_id_11cdfb23dd", unique: true
    t.index ["inventory_item_id"], name: "index_inventory_stocks_on_inventory_item_id"
    t.index ["inventory_warehouse_id"], name: "index_inventory_stocks_on_inventory_warehouse_id"
  end

  create_table "inventory_warehouses", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "location", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_inventory_warehouses_on_name", unique: true
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

  create_table "maintenance_equipment", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.text "description", default: "", null: false
    t.string "location", limit: 255, default: "", null: false
    t.string "status", default: "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_maintenance_equipment_on_name", unique: true
  end

  create_table "maintenance_frequencies", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "description", limit: 255, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_maintenance_frequencies_on_name", unique: true
  end

  create_table "maintenance_responsibles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "speciality", limit: 255, default: "", null: false
    t.string "status", default: "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["speciality"], name: "index_maintenance_responsibles_on_speciality"
    t.index ["status"], name: "index_maintenance_responsibles_on_status"
    t.index ["user_id"], name: "index_maintenance_responsibles_on_user_id", unique: true
  end

  create_table "measure_unit_types", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_measure_unit_types_on_name", unique: true
  end

  create_table "measure_units", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "abbreviation", limit: 64, null: false
    t.bigint "measure_unit_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["measure_unit_type_id"], name: "index_measure_units_on_measure_unit_type_id"
    t.index ["name"], name: "index_measure_units_on_name", unique: true
  end

  create_table "timezones", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.decimal "gmt_offset", precision: 3, scale: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_timezones_on_name", unique: true
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.date "date_of_birth", null: false
    t.bigint "country_id", null: false
    t.string "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_user_profiles_on_country_id"
    t.index ["date_of_birth"], name: "index_user_profiles_on_date_of_birth"
    t.index ["first_name"], name: "index_user_profiles_on_first_name"
    t.index ["gender"], name: "index_user_profiles_on_gender"
    t.index ["last_name"], name: "index_user_profiles_on_last_name"
    t.index ["user_id"], name: "index_user_profiles_on_user_id", unique: true
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "country_currencies", "countries"
  add_foreign_key "country_currencies", "currencies"
  add_foreign_key "country_languages", "countries"
  add_foreign_key "country_languages", "languages"
  add_foreign_key "country_timezones", "countries"
  add_foreign_key "country_timezones", "timezones"
  add_foreign_key "inventory_item_categories", "inventory_categories"
  add_foreign_key "inventory_item_categories", "inventory_items"
  add_foreign_key "inventory_items", "measure_units"
  add_foreign_key "inventory_stocks", "inventory_items"
  add_foreign_key "inventory_stocks", "inventory_warehouses"
  add_foreign_key "maintenance_responsibles", "users"
  add_foreign_key "measure_units", "measure_unit_types"
  add_foreign_key "user_profiles", "countries"
  add_foreign_key "user_profiles", "users"
end
