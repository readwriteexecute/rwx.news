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

ActiveRecord::Schema.define(version: 20170607153224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.string "short_id", limit: 10, default: "", null: false
    t.integer "story_id", null: false
    t.integer "user_id", null: false
    t.integer "parent_comment_id"
    t.integer "thread_id"
    t.text "comment", null: false
    t.integer "upvotes", default: 0, null: false
    t.integer "downvotes", default: 0, null: false
    t.decimal "confidence", precision: 20, scale: 19, default: "0.0", null: false
    t.text "markeddown_comment"
    t.boolean "is_deleted", default: false
    t.boolean "is_moderated", default: false
    t.boolean "is_from_email", default: false
    t.integer "hat_id"
    t.index ["confidence"], name: "confidence_idx"
    t.index ["short_id"], name: "short_id", unique: true
    t.index ["story_id", "short_id"], name: "story_id_short_id"
    t.index ["thread_id"], name: "thread_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "hat_requests", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "hat", limit: 255
    t.string "link", limit: 255
    t.text "comment"
  end

  create_table "hats", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.integer "granted_by_user_id"
    t.string "hat", limit: 255
    t.string "link", limit: 255
  end

  create_table "hidden_stories", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "story_id"
    t.index ["user_id", "story_id"], name: "index_hidden_stories_on_user_id_and_story_id", unique: true
  end

  create_table "invitation_requests", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.boolean "is_verified", default: false
    t.string "email", limit: 255
    t.string "name", limit: 255
    t.text "memo"
    t.string "ip_address", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "email", limit: 255
    t.string "code", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "memo"
  end

  create_table "keystores", id: false, force: :cascade do |t|
    t.string "key", limit: 50, default: "", null: false
    t.bigint "value"
    t.index ["key"], name: "key", unique: true
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.integer "author_user_id"
    t.integer "recipient_user_id"
    t.boolean "has_been_read", default: false
    t.string "subject", limit: 100
    t.text "body"
    t.string "short_id", limit: 30
    t.boolean "deleted_by_author", default: false
    t.boolean "deleted_by_recipient", default: false
    t.index ["short_id"], name: "random_hash", unique: true
  end

  create_table "moderations", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "moderator_user_id"
    t.integer "story_id"
    t.integer "comment_id"
    t.integer "user_id"
    t.text "action"
    t.text "reason"
    t.boolean "is_from_suggestions", default: false
  end

  create_table "stories", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.integer "user_id"
    t.string "url", limit: 250, default: ""
    t.string "title", limit: 150, default: "", null: false
    t.text "description"
    t.string "short_id", limit: 6, default: "", null: false
    t.boolean "is_expired", default: false, null: false
    t.integer "upvotes", default: 0, null: false
    t.integer "downvotes", default: 0, null: false
    t.boolean "is_moderated", default: false, null: false
    t.decimal "hotness", precision: 20, scale: 10, default: "0.0", null: false
    t.text "markeddown_description"
    t.text "story_cache"
    t.integer "comments_count", default: 0, null: false
    t.integer "merged_story_id"
    t.datetime "unavailable_at"
    t.string "twitter_id", limit: 20
    t.boolean "user_is_author", default: false
    t.datetime "updated_at"
    t.index ["created_at"], name: "index_stories_on_created_at"
    t.index ["hotness"], name: "hotness_idx"
    t.index ["is_expired", "is_moderated"], name: "is_idxes"
    t.index ["is_expired"], name: "index_stories_on_is_expired"
    t.index ["is_moderated"], name: "index_stories_on_is_moderated"
    t.index ["merged_story_id"], name: "index_stories_on_merged_story_id"
    t.index ["short_id"], name: "unique_short_id", unique: true
    t.index ["twitter_id"], name: "index_stories_on_twitter_id"
    t.index ["url"], name: "url"
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "suggested_taggings", id: :serial, force: :cascade do |t|
    t.integer "story_id"
    t.integer "tag_id"
    t.integer "user_id"
  end

  create_table "suggested_titles", id: :serial, force: :cascade do |t|
    t.integer "story_id"
    t.integer "user_id"
    t.string "title", limit: 150, default: "", null: false
  end

  create_table "tag_filters", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "tag_id"
    t.index ["user_id", "tag_id"], name: "user_tag_idx"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "story_id", null: false
    t.integer "tag_id", null: false
    t.index ["story_id", "tag_id"], name: "story_id_tag_id", unique: true
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "tag", limit: 25, default: "", null: false
    t.string "description", limit: 100
    t.boolean "privileged", default: false
    t.boolean "is_media", default: false
    t.boolean "inactive", default: false
    t.float "hotness_mod", default: 0.0
    t.index ["tag"], name: "tag", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", limit: 50
    t.string "email", limit: 100
    t.string "password_digest", limit: 75
    t.datetime "created_at"
    t.boolean "is_admin", default: false
    t.string "password_reset_token", limit: 75
    t.string "session_token", limit: 75, default: "", null: false
    t.text "about"
    t.integer "invited_by_user_id"
    t.boolean "is_moderator", default: false
    t.boolean "pushover_mentions", default: false
    t.string "rss_token", limit: 75
    t.string "mailing_list_token", limit: 75
    t.integer "mailing_list_mode", default: 0
    t.integer "karma", default: 0, null: false
    t.datetime "banned_at"
    t.integer "banned_by_user_id"
    t.string "banned_reason", limit: 200
    t.datetime "deleted_at"
    t.datetime "disabled_invite_at"
    t.integer "disabled_invite_by_user_id"
    t.string "disabled_invite_reason", limit: 200
    t.text "settings"
    t.index ["mailing_list_mode"], name: "mailing_list_enabled"
    t.index ["mailing_list_token"], name: "mailing_list_token", unique: true
    t.index ["password_reset_token"], name: "password_reset_token", unique: true
    t.index ["rss_token"], name: "rss_token", unique: true
    t.index ["session_token"], name: "session_hash", unique: true
    t.index ["username"], name: "username", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "story_id", null: false
    t.integer "comment_id"
    t.integer "vote", limit: 2, null: false
    t.string "reason", limit: 1
    t.index ["comment_id"], name: "index_votes_on_comment_id"
    t.index ["user_id", "comment_id"], name: "user_id_comment_id"
    t.index ["user_id", "story_id"], name: "user_id_story_id"
  end

end
