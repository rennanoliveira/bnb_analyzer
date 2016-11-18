require 'csv'

module CSVReaders
  class AirbnbReader

    # Listing only the headers we want (AirBnb gives us many, many more)
    HEADERS = [
        :access, :city, :country, :country_code, :description,
        :experiences_offered, :host_id, :host_identity_verified,
        :host_listings_count, :host_location, :host_name,
        :host_neighbourhood, :host_since, :host_total_listings_count,
        :host_verifications, :house_rules, :interaction, :is_location_exact,
        :jurisdiction_names, :last_scraped, :latitude, :license, :listing_url,
        :longitude, :market, :maximum_nights, :minimum_nights, :name,
        :neighborhood_overview, :neighbourhood, :neighbourhood_cleansed,
        :neighbourhood_group_cleansed, :notes, :number_of_reviews,
        :property_type, :requires_license, :review_scores_rating,
        :room_type, :scrape_id, :smart_location, :space, :state,
        :street, :summary, :transit, :zipcode
    ]

    def initialize(path)
      @path = path
    end

    def to_hash
      csv.map { |a| a.to_h.keep_if{|key| HEADERS.include?(key)} }
    end

    private

    def csv
      @csv ||= CSV.read(@path, headers: true, header_converters: :symbol, converters: [:all])
    end

  end
end