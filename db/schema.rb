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

ActiveRecord::Schema.define(version: 20170331051132) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "name",            limit: 255, null: false
    t.string   "password_digest", limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.text     "title",       limit: 65535
    t.text     "body",        limit: 65535
    t.boolean  "delete_flag", limit: 1,     default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "image",       limit: 255
  end

  create_table "tip_genres", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image",      limit: 255
  end

  create_table "tips", force: :cascade do |t|
    t.text     "title",       limit: 65535
    t.text     "detail",      limit: 65535
    t.boolean  "delete_flag", limit: 1
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "genre_id",    limit: 4,     default: 0, null: false
  end

  create_table "works", force: :cascade do |t|
    t.integer  "required_time", limit: 4, default: 0, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "blog_id",       limit: 4, default: 0, null: false
  end

end
