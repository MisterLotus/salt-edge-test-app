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

ActiveRecord::Schema.define(version: 2019_03_04_140003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "identifier", default: "", null: false
    t.string "secret", default: "", null: false
    t.integer "customer_id", null: false
    t.index ["identifier"], name: "index_customers_on_identifier", unique: true
  end

  create_table "logins", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.index ["id"], name: "index_logins_on_id", unique: true
  end

  create_table "logs", force: :cascade do |t|
    t.datetime "timestamp", null: false
    t.string "data", default: "", null: false
    t.index ["id"], name: "index_logs_on_id", unique: true
  end

  create_table "tokens", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "token", default: "", null: false
    t.string "expires_at", default: "", null: false
    t.string "connect_url", null: false
    t.index ["id"], name: "index_tokens_on_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
