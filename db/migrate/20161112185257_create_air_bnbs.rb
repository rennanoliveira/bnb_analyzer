class CreateAirBnbs < ActiveRecord::Migration[5.0]
  def change
    create_table :air_bnbs do |t|
      t.string :name
      t.string :listing_url
      t.integer :scrape_id
      t.date :last_scraped
      t.string :name
      t.text :summary
      t.text :space
      t.text :description
      t.text :experiences_offered
      t.text :neighborhood_overview
      t.text :notes
      t.text :transit
      t.text :access
      t.text :interaction
      t.text :house_rules
      t.integer :host_id
      t.integer :host_name
      t.date :host_since
      t.string :host_location
      t.string :host_neighbourhood
      t.integer :host_listings_count
      t.integer :host_total_listings_count
      t.integer :host_verifications
      t.boolean :host_identity_verified
      t.string :street
      t.string :neighbourhood
      t.string :neighbourhood_cleansed
      t.string :neighbourhood_group_cleansed
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :market
      t.string :smart_location
      t.string :country_code
      t.string :country
      t.boolean :is_location_exact
      t.string :property_type
      t.string :room_type
      t.integer :minimum_nights
      t.integer :maximum_nights
      t.integer :number_of_reviews
      t.integer :review_scores_rating
      t.boolean :requires_license
      t.string :license
      t.string :jurisdiction_names
      t.decimal :latitude, { precision: 10, scale: 6 }
      t.decimal :longitude, { precision: 10, scale: 6 }

      t.timestamps
    end
  end
end
