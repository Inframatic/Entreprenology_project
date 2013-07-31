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

ActiveRecord::Schema.define(version: 20130731202721) do

  create_table "accounts", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "industry"
    t.string   "country"
    t.string   "city"
    t.string   "zip_code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "logable_id"
    t.string   "logable_type"
  end

  create_table "interns", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
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
