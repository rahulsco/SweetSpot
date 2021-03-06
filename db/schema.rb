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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140205195753) do

  create_table "addresses", :force => true do |t|
    t.integer  "restaurant_id", :null => false
    t.string   "line1",         :null => false
    t.string   "line2"
    t.string   "city",          :null => false
    t.string   "state",         :null => false
    t.string   "zip",           :null => false
    t.string   "lat",           :null => false
    t.string   "lng",           :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "addresses", ["city"], :name => "index_addresses_on_city"
  add_index "addresses", ["restaurant_id"], :name => "index_addresses_on_restaurant_id", :unique => true
  add_index "addresses", ["state"], :name => "index_addresses_on_state"
  add_index "addresses", ["zip"], :name => "index_addresses_on_zip"

  create_table "categories", :force => true do |t|
    t.integer  "restaurant_id",                    :null => false
    t.boolean  "cake",          :default => false
    t.boolean  "cookies",       :default => false
    t.boolean  "crepes",        :default => false
    t.boolean  "cupcakes",      :default => false
    t.boolean  "yogurt",        :default => false
    t.boolean  "fruit",         :default => false
    t.boolean  "icecream",      :default => false
    t.boolean  "tea",           :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "categories", ["restaurant_id"], :name => "index_categories_on_restaurant_id"

  create_table "pictures", :force => true do |t|
    t.integer  "restaurant_id",      :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.text     "caption"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "pictures", ["restaurant_id"], :name => "index_pictures_on_restaurant_id"

  create_table "restaurants", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "phone"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "restaurants", ["name"], :name => "index_restaurants_on_name"

  create_table "reviews", :force => true do |t|
    t.integer  "user_id",       :null => false
    t.integer  "restaurant_id", :null => false
    t.integer  "rating",        :null => false
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "reviews", ["restaurant_id"], :name => "index_reviews_on_restaurant_id"
  add_index "reviews", ["user_id", "restaurant_id"], :name => "index_reviews_on_user_id_and_restaurant_id", :unique => true
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",           :null => false
    t.string   "password_digest",    :null => false
    t.string   "session_token",      :null => false
    t.string   "home",               :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
