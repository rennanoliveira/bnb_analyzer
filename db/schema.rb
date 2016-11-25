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

ActiveRecord::Schema.define(version: 20161125133950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "air_bnbs", force: :cascade do |t|
    t.string   "name"
    t.string   "listing_url"
    t.bigint   "scrape_id"
    t.date     "last_scraped"
    t.text     "summary"
    t.text     "space"
    t.text     "description"
    t.text     "experiences_offered"
    t.text     "neighborhood_overview"
    t.text     "notes"
    t.text     "transit"
    t.text     "access"
    t.text     "interaction"
    t.text     "house_rules"
    t.integer  "host_id"
    t.integer  "host_name"
    t.date     "host_since"
    t.string   "host_location"
    t.string   "host_neighbourhood"
    t.integer  "host_listings_count"
    t.integer  "host_total_listings_count"
    t.integer  "host_verifications"
    t.boolean  "host_identity_verified"
    t.string   "street"
    t.string   "neighbourhood"
    t.string   "neighbourhood_cleansed"
    t.string   "neighbourhood_group_cleansed"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "market"
    t.string   "smart_location"
    t.string   "country_code"
    t.string   "country"
    t.boolean  "is_location_exact"
    t.string   "property_type"
    t.string   "room_type"
    t.integer  "minimum_nights"
    t.integer  "maximum_nights"
    t.integer  "number_of_reviews"
    t.integer  "review_scores_rating"
    t.boolean  "requires_license"
    t.string   "license"
    t.string   "jurisdiction_names"
    t.decimal  "latitude",                     precision: 10, scale: 6
    t.decimal  "longitude",                    precision: 10, scale: 6
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "room_type_id"
  end

  create_table "multiple_dwelling_registrations", force: :cascade do |t|
    t.integer  "registration_id"
    t.string   "boro"
    t.integer  "boro_id"
    t.integer  "block"
    t.integer  "lot"
    t.integer  "bin"
    t.integer  "building_id"
    t.integer  "house_number"
    t.integer  "low_house_number"
    t.integer  "high_house_number"
    t.string   "address_street"
    t.integer  "address_code"
    t.integer  "zip_code"
    t.integer  "community_board"
    t.date     "registered_on"
    t.date     "registration_ends_on"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "room_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
