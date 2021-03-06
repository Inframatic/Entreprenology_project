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

ActiveRecord::Schema.define(version: 20130808014106) do

  create_table "accounts", force: true do |t|
    t.string   "email"
    t.string   "industry"
    t.string   "country"
    t.string   "city"
    t.string   "postal_code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "logable_id"
    t.string   "logable_type"
  end

  add_index "accounts", ["logable_id", "logable_type"], name: "index_accounts_on_logable_id_and_logable_type"

  create_table "favourited_lists", force: true do |t|
    t.integer  "favouritable_id"
    t.string   "favouritable_type"
    t.integer  "favourited_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interns", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "internship_contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "internship_id"
  end

  create_table "internships", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.text     "position_description"
    t.text     "requirements"
    t.boolean  "remuneration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "startup_id"
  end

  create_table "startups", force: true do |t|
    t.string   "company_name"
    t.integer  "number_of_employees"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "founded"
  end

end
