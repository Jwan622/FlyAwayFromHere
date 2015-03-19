ActiveRecord::Schema.define(version: 20150319043406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "type"
    t.string   "slug"
    t.string   "destination_airport"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "trip_info_id"
  end

  add_index "photos", ["category_id"], name: "index_photos_on_category_id", using: :btree
  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "real_trip_infos", force: :cascade do |t|
    t.integer  "price"
    t.datetime "departure_date"
    t.datetime "return_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "trip_infos", force: :cascade do |t|
    t.string   "title"
    t.string   "city"
    t.text     "short_description"
    t.text     "long_description"
    t.string   "airport"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "provider"
    t.string   "token"
    t.string   "uid"
    t.string   "image_url"
    t.string   "departure_city_slug"
  end

  add_foreign_key "photos", "categories"
  add_foreign_key "photos", "users"
end
