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

ActiveRecord::Schema.define(version: 20170706114849) do

  create_table "diaries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "article",         limit: 65535, null: false
    t.string   "article_title",                 null: false
    t.string   "article_image"
    t.string   "nation_name",                   null: false
    t.string   "city_name",                     null: false
    t.boolean  "publicity",                     null: false
    t.integer  "article_user_id",               null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "persons"
    t.integer  "all_price"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "messages",     limit: 65535, null: false
    t.boolean  "confirmation",               null: false
    t.integer  "user_id",                    null: false
    t.integer  "room_id",                    null: false
    t.date     "check_in",                   null: false
    t.date     "check_out",                  null: false
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "room_name",               null: false
    t.integer  "guest",                   null: false
    t.integer  "price",                   null: false
    t.string   "room_type",               null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "country",                 null: false
    t.string   "prefecture",              null: false
    t.string   "city",                    null: false
    t.string   "address",                 null: false
    t.integer  "user_id",                 null: false
    t.integer  "bed",                     null: false
    t.string   "image",      default: ""
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
