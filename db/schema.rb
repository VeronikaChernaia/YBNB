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

ActiveRecord::Schema[7.1].define(version: 2024_08_26_184028) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "check_in_date"
    t.date "check_out_date"
    t.float "final_price"
    t.text "booking_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "yacht_id", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["yacht_id"], name: "index_bookings_on_yacht_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "yacht_id", null: false
    t.integer "rating"
    t.text "content"
    t.date "date_reviewed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["yacht_id"], name: "index_reviews_on_yacht_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

  create_table "yachts", force: :cascade do |t|
    t.text "title"
    t.text "brand"
    t.string "price_per_hour"
    t.string "integer"
    t.text "description"
    t.text "port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_yachts_on_user_id"
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "yachts"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "yachts"
  add_foreign_key "yachts", "users"
end
