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

ActiveRecord::Schema.define(version: 20160615232437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "states", id: false, force: :cascade do |t|
    t.string "state_code", null: false
    t.string "state_name"
  end

  add_index "states", ["state_code"], name: "index_states_on_state_code", unique: true, using: :btree

  create_table "updates", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "cohort"
    t.string   "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "updates", ["user_id"], name: "index_updates_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "cohort",           default: "none"
    t.string   "name",             default: "none"
    t.string   "current_employer", default: "none"
    t.string   "github_id"
    t.string   "street_address",   default: "none"
    t.string   "city"
    t.string   "state"
    t.string   "image"
    t.string   "oauth_token"
    t.string   "email",            default: "none"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "role",             default: 0
    t.boolean  "first_login",      default: true
    t.float    "latitude"
    t.float    "longitude"
    t.string   "screen_name"
    t.string   "status",           default: "none"
  end

  add_foreign_key "updates", "users"
end
