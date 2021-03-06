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

ActiveRecord::Schema.define(:version => 20130123130656) do

  create_table "games", :force => true do |t|
    t.boolean  "started",    :default => false
    t.string   "mode",       :default => "single"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "text"
    t.string   "answer"
    t.integer  "value"
    t.boolean  "daily_double"
    t.integer  "topic_id"
    t.boolean  "answered"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "mode"
    t.text     "other_answers"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "points",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "order"
    t.string   "quote"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "mode"
  end

end
