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

ActiveRecord::Schema.define(version: 2019_09_12_063841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "design_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "upvotes", default: 0
    t.integer "downvotes", default: 0
    t.float "x"
    t.float "y"
    t.index ["design_id"], name: "index_comments_on_design_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "design_design_tags", force: :cascade do |t|
    t.bigint "design_id"
    t.bigint "design_tag_id"
    t.index ["design_id"], name: "index_design_design_tags_on_design_id"
    t.index ["design_tag_id"], name: "index_design_design_tags_on_design_tag_id"
  end

  create_table "design_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designs", force: :cascade do |t|
    t.string "photo"
    t.string "title"
    t.text "description"
    t.string "category"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_designs_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.text "note"
    t.bigint "user_id"
    t.bigint "job_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["job_post_id"], name: "index_job_applications_on_job_post_id"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "job_experiences", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.index ["user_id"], name: "index_job_experiences_on_user_id"
  end

  create_table "job_posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "photo"
    t.string "profession"
    t.string "location"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_type"
    t.index ["user_id"], name: "index_job_posts_on_user_id"
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
    t.string "job"
    t.text "bio"
    t.string "city"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comment_id"
    t.integer "upvotes", default: 0
    t.integer "downvotes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_votes_on_comment_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "comments", "designs"
  add_foreign_key "comments", "users"
  add_foreign_key "design_design_tags", "design_tags"
  add_foreign_key "design_design_tags", "designs"
  add_foreign_key "designs", "users"
  add_foreign_key "job_applications", "job_posts"
  add_foreign_key "job_applications", "users"
  add_foreign_key "job_experiences", "users"
  add_foreign_key "job_posts", "users"
  add_foreign_key "votes", "comments"
  add_foreign_key "votes", "users"
end
