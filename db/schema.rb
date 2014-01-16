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

ActiveRecord::Schema.define(version: 20140116151600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "pages", force: true do |t|
    t.string   "name"
    t.integer  "chapter"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.string   "image"
  end

  add_index "pages", ["post_id"], name: "index_pages_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "images"
    t.text     "steps"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["post_id"], name: "index_tags_on_post_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
