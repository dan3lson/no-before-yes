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

ActiveRecord::Schema.define(version: 2020_08_21_185025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "ahoy_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "visit_id"
    t.uuid "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.uuid "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "contacts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "website"
    t.string "email"
    t.string "phone_number"
    t.string "note"
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_contacts_on_name"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "goals", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "target", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "time_zone", default: "UTC"
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.integer "onboarding", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["onboarding"], name: "index_users_on_onboarding"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "touchpoints", "contacts"
  add_foreign_key "touchpoints", "users"
end
