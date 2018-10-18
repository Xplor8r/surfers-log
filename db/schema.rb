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

ActiveRecord::Schema.define(version: 2018_10_18_215945) do

  create_table "logs", force: :cascade do |t|
    t.string "surf_spot"
    t.integer "date"
    t.text "log"
    t.string "swell_direction"
    t.integer "swell_size"
    t.string "conditions"
    t.integer "wave_count"
    t.string "image_url"
    t.integer "surfer_id"
  end

  create_table "surfers", force: :cascade do |t|
    t.string "surfername"
    t.string "email"
    t.string "password_digest"
  end

end
