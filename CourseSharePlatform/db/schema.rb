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

ActiveRecord::Schema[7.1].define(version: 2023_11_15_011120) do
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

  create_table "course_comments", force: :cascade do |t|
    t.integer "course_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["course_id"], name: "index_course_comments_on_course_id"
    t.index ["user_id"], name: "index_course_comments_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "courses"
  add_foreign_key "articles", "users"
  add_foreign_key "course_comments", "courses"
  add_foreign_key "course_comments", "users"
  add_foreign_key "course_scores", "courses"
  add_foreign_key "course_scores", "users"
  add_foreign_key "followships", "users"
  add_foreign_key "followships", "users", column: "following_user_id"
end
