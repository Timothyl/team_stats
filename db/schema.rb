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

ActiveRecord::Schema.define(version: 20151008144451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer "team_id",  null: false
    t.integer "match_id", null: false
    t.json    "info"
  end

  create_table "rosters", force: :cascade do |t|
    t.integer "summoner_id", null: false
    t.integer "team_id",     null: false
    t.integer "kills"
    t.integer "deaths"
    t.integer "assists"
  end

  create_table "summoners", force: :cascade do |t|
    t.integer  "riot_id",    null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "summoners", ["name"], name: "index_summoners_on_name", unique: true, using: :btree
  add_index "summoners", ["riot_id"], name: "index_summoners_on_riot_id", unique: true, using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "full_Id",    null: false
    t.string   "name",       null: false
    t.string   "tag",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["full_Id"], name: "index_teams_on_full_Id", unique: true, using: :btree
  add_index "teams", ["name"], name: "index_teams_on_name", unique: true, using: :btree

end
