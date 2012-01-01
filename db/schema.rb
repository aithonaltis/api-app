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

ActiveRecord::Schema.define(:version => 20120101011520) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.integer  "university_id"
    t.integer  "faculty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["faculty_id"], :name => "index_departments_on_faculty_id"
  add_index "departments", ["university_id"], :name => "index_departments_on_university_id"

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["city_id"], :name => "index_districts_on_city_id"

  create_table "faculties", :force => true do |t|
    t.string   "name"
    t.integer  "university_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faculties", ["university_id"], :name => "index_faculties_on_university_id"

  create_table "names", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regions", ["district_id"], :name => "index_regions_on_district_id"

  create_table "request_infos", :force => true do |t|
    t.string   "ip"
    t.string   "url"
    t.string   "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "streets", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "streets", ["region_id"], :name => "index_streets_on_region_id"

  create_table "universities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
