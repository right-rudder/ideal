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

ActiveRecord::Schema[7.0].define(version: 2023_05_02_105747) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkouts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "certifications"
    t.string "interested_aircraft"
    t.date "preferred_date"
    t.string "preferred_availability"
    t.date "alternate_date"
    t.string "alternate_availability"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discover_flights", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "aircraft"
    t.date "preferred_date"
    t.string "preferred_availability"
    t.date "alternate_date"
    t.string "alternate_availability"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quiz_results", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "in_us"
    t.string "program"
    t.text "why_pilot"
    t.string "previous_training"
    t.text "wings_lift"
    t.text "goals"
    t.boolean "schedule_visit"
    t.date "preferred_date"
    t.string "preferred_availability"
    t.date "alternate_date"
    t.string "alternate_availability"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "learn_style"
    t.string "structure"
    t.string "feedback"
    t.string "approach"
  end

end
