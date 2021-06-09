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

ActiveRecord::Schema.define(version: 20210609144543) do

  create_table "accepted_designers_taxonomies", force: :cascade do |t|
    t.integer  "designer_id", limit: 4, null: false
    t.integer  "taxonomy_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "accepted_designers_taxonomies", ["designer_id"], name: "fk_rails_6778c2e781", using: :btree
  add_index "accepted_designers_taxonomies", ["taxonomy_id"], name: "fk_rails_8b037d8369", using: :btree

  create_table "designers", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "designers_taxonomies", force: :cascade do |t|
    t.integer  "designer_id", limit: 4, null: false
    t.integer  "taxonomy_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "designers_taxonomies", ["designer_id"], name: "fk_rails_0d02ce4693", using: :btree
  add_index "designers_taxonomies", ["taxonomy_id"], name: "fk_rails_a7a282df18", using: :btree

  create_table "exception_designers_taxonomies", force: :cascade do |t|
    t.integer  "designer_id", limit: 4, null: false
    t.integer  "taxonomy_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "exception_designers_taxonomies", ["designer_id"], name: "fk_rails_6b6a46b47c", using: :btree
  add_index "exception_designers_taxonomies", ["taxonomy_id"], name: "fk_rails_7a7d164955", using: :btree

  create_table "items", force: :cascade do |t|
    t.string  "name",        limit: 255, null: false
    t.integer "designer_id", limit: 4,   null: false
    t.integer "taxonomy_id", limit: 4,   null: false
  end

  add_index "items", ["designer_id"], name: "fk_rails_9ddca5c9e5", using: :btree
  add_index "items", ["taxonomy_id"], name: "fk_rails_ee200e3f72", using: :btree

  create_table "taxonomies", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "accepted_designers_taxonomies", "designers"
  add_foreign_key "accepted_designers_taxonomies", "taxonomies"
  add_foreign_key "designers_taxonomies", "designers"
  add_foreign_key "designers_taxonomies", "taxonomies"
  add_foreign_key "exception_designers_taxonomies", "designers"
  add_foreign_key "exception_designers_taxonomies", "taxonomies"
  add_foreign_key "items", "designers"
  add_foreign_key "items", "taxonomies"
end
