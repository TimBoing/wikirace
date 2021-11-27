# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_20_162148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "game_sessions", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language"
    t.index ["user_id"], name: "index_game_sessions_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_session_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_session_id"], name: "index_messages_on_game_session_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "paths", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "start_page_id"
    t.bigint "end_page_id"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_page_id"], name: "index_paths_on_end_page_id"
    t.index ["start_page_id"], name: "index_paths_on_start_page_id"
    t.index ["user_id"], name: "index_paths_on_user_id"
  end

  create_table "points", force: :cascade do |t|
    t.integer "position"
    t.bigint "path_id"
    t.bigint "wiki_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["path_id"], name: "index_points_on_path_id"
    t.index ["wiki_page_id"], name: "index_points_on_wiki_page_id"
  end

  create_table "round_participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "round_id"
    t.integer "score", default: 0
    t.integer "rank"
    t.integer "item1_used"
    t.integer "item2_used"
    t.integer "item3_used"
    t.integer "item4_used"
    t.integer "item5_used"
    t.integer "item6_used"
    t.string "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_round_participations_on_round_id"
    t.index ["user_id"], name: "index_round_participations_on_user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.string "start_page"
    t.string "start_page_url"
    t.string "end_page"
    t.string "end_page_url"
    t.string "game_mode"
    t.string "game_options"
    t.boolean "search_bar", default: true
    t.boolean "reverse", default: false
    t.boolean "start_page_random", default: false
    t.boolean "end_page_random", default: false
    t.string "state", default: "initiated"
    t.string "start_time"
    t.bigint "game_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "back", default: true
    t.boolean "charlie", default: false
    t.index ["game_session_id"], name: "index_rounds_on_game_session_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.integer "coins"
    t.integer "item1"
    t.integer "item2"
    t.integer "item3"
    t.integer "item4"
    t.integer "item5"
    t.string "unique_session_id", limit: 20
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visited_pages", force: :cascade do |t|
    t.bigint "round_participation_id"
    t.string "title"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_participation_id"], name: "index_visited_pages_on_round_participation_id"
  end

  create_table "wiki_pages", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "categories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "game_sessions", "users"
  add_foreign_key "messages", "game_sessions"
  add_foreign_key "messages", "users"
  add_foreign_key "paths", "users"
  add_foreign_key "points", "paths"
  add_foreign_key "points", "wiki_pages"
  add_foreign_key "round_participations", "rounds"
  add_foreign_key "round_participations", "users"
  add_foreign_key "rounds", "game_sessions"
  add_foreign_key "visited_pages", "round_participations"
end
