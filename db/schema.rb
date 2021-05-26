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

ActiveRecord::Schema.define(version: 2021_06_30_061742) do

  create_table "comments", force: :cascade do |t|
    t.string "comment_name"
    t.text "comment_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "daily_report_id"
    t.index ["daily_report_id"], name: "index_comments_on_daily_report_id"
  end

  create_table "daily_reports", force: :cascade do |t|
    t.string "team"
    t.text "body"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "title"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
