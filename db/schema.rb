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

ActiveRecord::Schema.define(version: 2020_04_04_021352) do

  create_table "group_volunteers", force: :cascade do |t|
    t.integer "group_id"
    t.integer "volunteer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "statement"
    t.index ["group_id"], name: "index_group_volunteers_on_group_id"
    t.index ["volunteer_id"], name: "index_group_volunteers_on_volunteer_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "program_name"
    t.string "chair_first"
    t.string "chair_last"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "kind"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "organization"
    t.string "sector"
    t.boolean "active_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  add_foreign_key "group_volunteers", "groups"
  add_foreign_key "group_volunteers", "volunteers"
end
