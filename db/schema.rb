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

ActiveRecord::Schema.define(version: 20150304221258) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_trips", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "category_id"
  end

  add_index "categories_trips", ["category_id"], name: "index_categories_trips_on_category_id"
  add_index "categories_trips", ["trip_id"], name: "index_categories_trips_on_trip_id"

  create_table "itineraries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.integer  "category_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "photos", ["category_id"], name: "index_photos_on_category_id"
  add_index "photos", ["trip_id"], name: "index_photos_on_trip_id"
  add_index "photos", ["user_id"], name: "index_photos_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.text    "content"
    t.integer "votes"
    t.integer "user_id"
    t.integer "trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string   "title"
    t.integer  "price"
    t.string   "description"
    t.integer  "ranking"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "airline"
    t.datetime "flight_date"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "role"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "provider"
    t.string   "token"
    t.string   "uid"
    t.string   "image_url"
  end

end
