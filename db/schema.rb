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

ActiveRecord::Schema.define(version: 2019_01_23_153345) do

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
    t.index ["filename"], name: "index_active_storage_blobs_on_filename"
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.datetime "created_at"
    t.integer "subject_id", null: false
    t.string "subject_type", null: false
    t.integer "object_id"
    t.string "object_type"
    t.string "name", null: false
    t.boolean "checked", null: false
    t.integer "actor_id", null: false
    t.integer "receiver_id"
    t.index ["actor_id"], name: "index_activities_on_actor_id"
    t.index ["subject_id"], name: "index_activities_on_subject_id"
    t.index ["subject_type"], name: "index_activities_on_subject_type"
  end

  create_table "blocks", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "channel_blocks", force: :cascade do |t|
    t.integer "channel_id"
    t.integer "block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channel_followers", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "channel_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.boolean "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_channels_on_name"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "block_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feed_activities", force: :cascade do |t|
    t.boolean "seen", default: false
    t.bigint "feed_id"
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_feed_activities_on_activity_id"
    t.index ["feed_id"], name: "index_feed_activities_on_feed_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feeds_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "user_channels", force: :cascade do |t|
    t.integer "user_id"
    t.integer "channel_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

end
