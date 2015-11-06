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

ActiveRecord::Schema.define(version: 20151105215051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "teams", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "description"
    t.integer  "user_teams_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "todo_assignments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string   "name",                                 null: false
    t.string   "description"
    t.datetime "due_date"
    t.boolean  "done",                 default: false
    t.integer  "priority",             default: 2
    t.integer  "todo_assignment_id"
    t.string   "todo_assignment_type"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "todos", ["todo_assignment_type", "todo_assignment_id"], name: "index_todos_on_todo_assignment_type_and_todo_assignment_id", using: :btree

  create_table "user_teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.integer  "user_teams_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
