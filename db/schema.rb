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

ActiveRecord::Schema.define(version: 2020_05_26_053030) do

  create_table "dailies", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_dailies_on_user_id"
  end

  create_table "habit_tags", force: :cascade do |t|
    t.integer "habit_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["habit_id"], name: "index_habit_tags_on_habit_id"
    t.index ["tag_id"], name: "index_habit_tags_on_tag_id"
  end

  create_table "habits", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "daily_id"
    t.string "title"
    t.integer "difficulty"
    t.text "note"
    t.boolean "completed"
    t.string "streak"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_id"], name: "index_habits_on_daily_id"
    t.index ["user_id"], name: "index_habits_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.string "email"
    t.string "password_digest"
    t.integer "pin"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "dailies", "users"
  add_foreign_key "habit_tags", "habits"
  add_foreign_key "habit_tags", "tags"
  add_foreign_key "habits", "dailies"
  add_foreign_key "habits", "users"
end
