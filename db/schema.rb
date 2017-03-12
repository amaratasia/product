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

ActiveRecord::Schema.define(version: 20170311093553) do

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "comments", force: :cascade do |t|
    t.string   "data",       limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.integer  "parent_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["post_id"], name: "fk_rails_2fd19c0db7", using: :btree
  add_index "comments", ["user_id"], name: "fk_rails_03de2dc08c", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "group_type", limit: 7,   default: "SECRET"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", limit: 4, null: false
    t.integer "user_id",  limit: 4, null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "img_path",   limit: 255
    t.string "product_id", limit: 255
  end

  create_table "posts", force: :cascade do |t|
    t.string   "data",       limit: 255
    t.string   "post_type",  limit: 4,   default: "TEXT"
    t.integer  "user_id",    limit: 4
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "posts", ["group_id"], name: "fk_rails_08dacf9824", using: :btree
  add_index "posts", ["user_id"], name: "fk_rails_5b5ddfd518", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "sku_id",         limit: 255
    t.integer  "price",          limit: 4
    t.text     "description",    limit: 65535
    t.datetime "expire_date"
    t.boolean  "admin_approved",               default: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "products", ["sku_id"], name: "index_products_on_sku_id", using: :btree

  create_table "products_categories_mapping", id: false, force: :cascade do |t|
    t.integer "product_id",  limit: 4
    t.integer "category_id", limit: 4
  end

  add_index "products_categories_mapping", ["category_id"], name: "index_products_categories_mapping_on_category_id", using: :btree
  add_index "products_categories_mapping", ["product_id"], name: "index_products_categories_mapping_on_product_id", using: :btree

  create_table "products_tags_mapping", id: false, force: :cascade do |t|
    t.integer "product_id", limit: 4
    t.integer "tag_id",     limit: 4
  end

  add_index "products_tags_mapping", ["product_id"], name: "index_products_tags_mapping_on_product_id", using: :btree
  add_index "products_tags_mapping", ["tag_id"], name: "index_products_tags_mapping_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "groups"
  add_foreign_key "posts", "users"
end
