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

ActiveRecord::Schema.define(version: 20151105190326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "teams", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teams_todos", id: false, force: :cascade do |t|
    t.integer "todo_id"
    t.integer "team_id"
  end

  add_index "teams_todos", ["team_id"], name: "index_teams_todos_on_team_id", using: :btree
  add_index "teams_todos", ["todo_id"], name: "index_teams_todos_on_todo_id", using: :btree

  create_table "todos", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "description"
    t.datetime "due_date"
    t.boolean  "done",        default: false
    t.integer  "priority",    default: 2
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users_teams", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  add_index "users_teams", ["team_id"], name: "index_users_teams_on_team_id", using: :btree
  add_index "users_teams", ["user_id"], name: "index_users_teams_on_user_id", using: :btree

  create_table "users_todos", id: false, force: :cascade do |t|
    t.integer "todo_id"
    t.integer "user_id"
  end

  add_index "users_todos", ["todo_id"], name: "index_users_todos_on_todo_id", using: :btree
  add_index "users_todos", ["user_id"], name: "index_users_todos_on_user_id", using: :btree

end
