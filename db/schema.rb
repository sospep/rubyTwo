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

ActiveRecord::Schema.define(version: 20190917205223) do

  create_table "balloons", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "username"
    t.text "body"
    t.integer "balloon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["balloon_id"], name: "index_comments_on_balloon_id"
  end

  create_table "seatmaps", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "rows"
    t.string "seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
