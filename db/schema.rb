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

ActiveRecord::Schema.define(version: 20180920081459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "intarray"

  create_table "genres", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "genres_movies", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "genre_id"
  end

  create_table "item_item_matrix", id: false, force: :cascade do |t|
    t.integer "u_id"
    t.integer "v_id"
    t.float   "sim_score", default: 0.0
  end

  add_index "item_item_matrix", ["u_id", "sim_score", "v_id"], name: "index_item_item_matrix_on_u_id_and_sim_score_and_v_id", using: :btree
  add_index "item_item_matrix", ["u_id", "v_id"], name: "index_item_item_matrix_on_u_id_and_v_id", unique: true, using: :btree

  create_table "movies", force: :cascade do |t|
    t.string  "title",         limit: 255
    t.date    "release_date"
    t.integer "like_user_ids",             default: [], array: true
  end

  add_index "movies", ["like_user_ids"], name: "like_user_ids_idx", using: :gist
  add_index "movies", ["like_user_ids"], name: "like_user_ids_idx_2", using: :gin

  create_table "occupations", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.integer  "rating"
    t.datetime "rated_at"
  end

  add_index "ratings", ["user_id", "movie_id"], name: "index_ratings_on_user_id_and_movie_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.integer "age"
    t.string  "gender",        limit: 1
    t.integer "occupation_id"
    t.string  "zip_code",      limit: 255
  end

end
