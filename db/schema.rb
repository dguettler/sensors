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

ActiveRecord::Schema.define(version: 20140802045828) do

  create_table "my_user_preferences", force: true do |t|
    t.integer "user_id",    null: false
    t.string  "name",       null: false
    t.string  "pref_value"
  end

  create_table "readings", force: true do |t|
    t.integer  "sensor_id"
    t.string   "data"
    t.datetime "created_at"
  end

  create_table "sensors", force: true do |t|
    t.string "type"
  end

  create_table "site_affiliations", force: true do |t|
    t.string "name"
  end

  add_index "site_affiliations", ["name"], name: "index_site_affiliations_name", using: :btree

  create_table "site_assigned_groups", force: true do |t|
    t.integer  "group_id"
    t.integer  "menu_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_assigned_groups", ["group_id"], name: "index_site_assigned_groups_on_group_id", using: :btree
  add_index "site_assigned_groups", ["menu_id"], name: "index_site_assigned_groups_on_menu_id", using: :btree
  add_index "site_assigned_groups", ["type"], name: "index_site_assigned_groups_on_type", using: :btree

  create_table "site_dictionaries", force: true do |t|
    t.string "program"
    t.string "name"
    t.text   "value"
    t.string "klass"
  end

  add_index "site_dictionaries", ["program", "name"], name: "index_site_dictionaries_on_prog_name", using: :btree

  create_table "site_group_memberships", force: true do |t|
    t.integer  "person_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_group_memberships", ["group_id"], name: "index_site_group_memberships_on_group_id", using: :btree
  add_index "site_group_memberships", ["person_id"], name: "index_site_group_memberships_on_person_id", using: :btree

  create_table "site_groups", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "avatar"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_groups", ["name"], name: "index_site_groups_on_name", using: :btree
  add_index "site_groups", ["type"], name: "index_site_groups_on_type", using: :btree

  create_table "site_menus", force: true do |t|
    t.integer  "section_id"
    t.string   "block",               limit: 16
    t.string   "name"
    t.string   "URL"
    t.float    "priority"
    t.boolean  "protected"
    t.boolean  "visible"
    t.integer  "highlighted_menu_id"
    t.boolean  "disambiguate"
    t.boolean  "reference"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",              limit: 16
  end

  add_index "site_menus", ["URL"], name: "index_site_menus_on_URL", using: :btree
  add_index "site_menus", ["reference"], name: "index_site_menus_on_reference", using: :btree
  add_index "site_menus", ["section_id"], name: "index_site_menus_on_section_id", using: :btree

  create_table "site_notifications", force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.integer "group_id"
  end

  add_index "site_notifications", ["event_id"], name: "index_site_notifications_on_event_id", using: :btree

  create_table "site_permissions", force: true do |t|
    t.integer "menu_id"
    t.integer "group_id"
    t.string  "privilege", limit: 8
  end

  add_index "site_permissions", ["group_id"], name: "index_site_permissions_on_group_id", using: :btree
  add_index "site_permissions", ["menu_id"], name: "index_site_permissions_on_menu_id", using: :btree

  create_table "site_sections", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "top_menu",   default: false, null: false
    t.integer  "priority"
  end

  add_index "site_sections", ["top_menu"], name: "index_site_sections_on_top_menu", using: :btree

  create_table "site_settings", force: true do |t|
    t.string "param",       limit: 32, null: false
    t.string "param_value",            null: false
    t.string "value_type",  limit: 16
    t.text   "comment"
  end

  add_index "site_settings", ["param"], name: "index_site_settings_on_param", using: :btree

  create_table "site_users", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "position"
    t.boolean  "is_pi"
    t.string   "status",          limit: 16
    t.text     "comments"
    t.string   "email"
    t.string   "phone_office"
    t.string   "userID"
    t.string   "password"
    t.boolean  "csb",                         default: true, null: false
    t.string   "payroll"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "pi_id"
    t.string   "degree",          limit: 128
    t.string   "alternate_email"
    t.string   "middle_initial",  limit: 2
    t.boolean  "active",                      default: true
    t.string   "public_token",    limit: 32
  end

  add_index "site_users", ["active"], name: "index_site_users_on_active", using: :btree
  add_index "site_users", ["csb"], name: "index_site_users_on_csb", using: :btree
  add_index "site_users", ["position"], name: "index_site_users_on_position", using: :btree
  add_index "site_users", ["public_token"], name: "index_site_users_on_public_token", using: :btree
  add_index "site_users", ["status"], name: "index_site_users_on_status", using: :btree
  add_index "site_users", ["userID"], name: "index_site_users_on_userID", using: :btree

  create_table "wiki_comments", force: true do |t|
    t.integer  "wiki_page_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wiki_comments", ["wiki_page_id"], name: "index_wiki_comments_on_wiki_page_id", using: :btree

  create_table "wiki_page_versions", force: true do |t|
    t.integer  "page_id",      null: false
    t.integer  "updator_id"
    t.integer  "number"
    t.string   "comment"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.text     "html_content"
    t.integer  "section_id"
    t.integer  "menu_id"
    t.integer  "protected"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wiki_page_versions", ["page_id"], name: "index_wiki_page_versions_on_page_id", using: :btree
  add_index "wiki_page_versions", ["updator_id"], name: "index_wiki_page_versions_on_updator_id", using: :btree

  create_table "wiki_pages", force: true do |t|
    t.integer  "creator_id"
    t.integer  "updator_id"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.text     "html_content"
    t.integer  "section_id"
    t.integer  "menu_id"
    t.boolean  "protected",          default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ratings_counter"
    t.float    "average_rating"
    t.boolean  "allow_comments",     default: false
    t.boolean  "allow_ratings",      default: false
    t.boolean  "template",           default: false, null: false
    t.datetime "content_updated_at"
  end

  add_index "wiki_pages", ["creator_id"], name: "index_wiki_pages_on_creator_id", using: :btree
  add_index "wiki_pages", ["path"], name: "index_wiki_pages_on_path", unique: true, using: :btree
  add_index "wiki_pages", ["template"], name: "index_wiki_pages_on_template", using: :btree

  create_table "wiki_ratings", force: true do |t|
    t.integer  "wiki_page_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wiki_ratings", ["wiki_page_id"], name: "index_wiki_ratings_on_wiki_page_id", using: :btree

end
