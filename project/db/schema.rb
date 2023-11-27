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

ActiveRecord::Schema[7.1].define(version: 2023_11_27_125716) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "article_favors", force: :cascade do |t|
    t.integer "favor_user_id", null: false
    t.integer "favor_article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favor_article_id"], name: "index_article_favors_on_favor_article_id"
    t.index ["favor_user_id"], name: "index_article_favors_on_favor_user_id"
  end

  create_table "article_likes", force: :cascade do |t|
    t.integer "like_user_id", null: false
    t.integer "like_article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["like_article_id"], name: "index_article_likes_on_like_article_id"
    t.index ["like_user_id"], name: "index_article_likes_on_like_user_id"
  end

  create_table "article_tags", force: :cascade do |t|
    t.integer "article_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_tags_on_article_id"
  end

  create_table "articles", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "user_id", null: false
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_articles_on_course_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "course_comment_likes", force: :cascade do |t|
    t.integer "like_user_id", null: false
    t.integer "like_course_comment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["like_course_comment_id"], name: "index_course_comment_likes_on_like_course_comment_id"
    t.index ["like_user_id"], name: "index_course_comment_likes_on_like_user_id"
  end

  create_table "course_comments", force: :cascade do |t|
    t.integer "course_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["course_id"], name: "index_course_comments_on_course_id"
    t.index ["user_id"], name: "index_course_comments_on_user_id"
  end

  create_table "course_files", force: :cascade do |t|
    t.integer "course_id", null: false
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_files_on_course_id"
  end

  create_table "course_scores", force: :cascade do |t|
    t.float "course_score"
    t.integer "course_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_scores_on_course_id"
    t.index ["user_id"], name: "index_course_scores_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.string "course_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "following_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["following_user_id"], name: "index_followships_on_following_user_id"
    t.index ["user_id"], name: "index_followships_on_user_id"
  end

  create_table "question_replies", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.string "content"
    t.integer "accepted", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_replies_on_question_id"
    t.index ["user_id"], name: "index_question_replies_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "user_id", null: false
    t.string "title"
    t.string "content"
    t.integer "solved", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_questions_on_course_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.string "img_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "realname"
    t.string "studentcode"
    t.string "personal_sign"
    t.integer "admin", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "article_favors", "articles", column: "favor_article_id"
  add_foreign_key "article_favors", "users", column: "favor_user_id"
  add_foreign_key "article_likes", "articles", column: "like_article_id"
  add_foreign_key "article_likes", "users", column: "like_user_id"
  add_foreign_key "article_tags", "articles"
  add_foreign_key "articles", "courses"
  add_foreign_key "articles", "users"
  add_foreign_key "course_comment_likes", "course_comments", column: "like_course_comment_id"
  add_foreign_key "course_comment_likes", "users", column: "like_user_id"
  add_foreign_key "course_comments", "courses"
  add_foreign_key "course_comments", "users"
  add_foreign_key "course_files", "courses"
  add_foreign_key "course_scores", "courses"
  add_foreign_key "course_scores", "users"
  add_foreign_key "followships", "users"
  add_foreign_key "followships", "users", column: "following_user_id"
  add_foreign_key "question_replies", "questions"
  add_foreign_key "question_replies", "users"
  add_foreign_key "questions", "courses"
  add_foreign_key "questions", "users"
end
