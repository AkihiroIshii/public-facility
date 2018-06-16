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

ActiveRecord::Schema.define(version: 20180616022744) do

  create_table "buildings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "building_number"
    t.string   "name"
    t.decimal  "construction_year",               precision: 4
    t.float    "floor_area",           limit: 24
    t.integer  "last_updated_user_id",                          null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["building_number"], name: "index_buildings_on_building_number", unique: true, using: :btree
    t.index ["last_updated_user_id"], name: "index_buildings_on_last_updated_user_id", using: :btree
  end

  create_table "facilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "facility_number"
    t.string   "name"
    t.string   "district"
    t.string   "address"
    t.string   "facility_type"
    t.float    "floor_area",           limit: 24
    t.string   "division_in_charge"
    t.integer  "last_updated_user_id",            null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["facility_number"], name: "index_facilities_on_facility_number", unique: true, using: :btree
    t.index ["last_updated_user_id"], name: "index_facilities_on_last_updated_user_id", using: :btree
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "facility_id"
    t.integer  "building_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["building_id"], name: "index_relationships_on_building_id", using: :btree
    t.index ["facility_id", "building_id"], name: "index_relationships_on_facility_id_and_building_id", unique: true, using: :btree
    t.index ["facility_id"], name: "index_relationships_on_facility_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "relationships", "buildings"
  add_foreign_key "relationships", "facilities"
end
