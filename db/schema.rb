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

ActiveRecord::Schema.define(version: 2020_07_20_044249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "contacts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "website"
    t.string "email"
    t.string "phone_number"
    t.string "note"
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_contacts_on_name", unique: true
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "touchpoints", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "recap", null: false
    t.date "follow_up_on", null: false
    t.integer "source", default: 0, null: false
    t.integer "result", default: 0, null: false
    t.uuid "user_id", null: false
    t.uuid "contact_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_touchpoints_on_contact_id"
    t.index ["user_id"], name: "index_touchpoints_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "touchpoints", "contacts"
  add_foreign_key "touchpoints", "users"
end
