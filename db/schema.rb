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

ActiveRecord::Schema.define(version: 20151015190330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer "team_id",  null: false
    t.integer "match_id", null: false
    t.json    "info"
  end

  create_table "rosters", force: :cascade do |t|
    t.integer  "summoner_id",                                           null: false
    t.integer  "team_id",                                               null: false
    t.integer  "kills"
    t.integer  "deaths"
    t.integer  "assists"
    t.datetime "joindate"
    t.decimal  "total_percent_damage_dealt",    precision: 4, scale: 1
    t.integer  "total_number_of_games"
    t.decimal  "avg_percent_damage",            precision: 4, scale: 1
    t.decimal  "total_percent_magic_damage",    precision: 4, scale: 1
    t.decimal  "total_percent_physical_damage", precision: 4, scale: 1
    t.decimal  "total_percent_true_damage",     precision: 4, scale: 1
    t.decimal  "avg_phys_damage",               precision: 4, scale: 1
    t.decimal  "avg_magic_damage",              precision: 4, scale: 1
    t.decimal  "avg_true_damage",               precision: 4, scale: 1
    t.integer  "total_gold"
    t.integer  "avg_gold"
    t.integer  "total_cs"
    t.integer  "total_jungle_cs"
    t.integer  "avg_cs"
    t.integer  "avg_jungle_cs"
    t.integer  "total_cs_diff"
    t.integer  "avg_cs_diff"
    t.decimal  "wards_placed",                  precision: 4, scale: 1
    t.decimal  "wards_destroyed",               precision: 4, scale: 1
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
