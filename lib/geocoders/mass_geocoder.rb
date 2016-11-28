module Geocoders
  class MassGeocoder

    LIMIT = 2_500

    def initialize(geocoder=GoogleMaps, api_keys)
      @geocoder = geocoder.new
      @api_keys = api_keys
    end

    def run(collection)
      api_keys.each { |api_key| mass_geocode(collection, api_key) }
    end

    private

    attr_reader :geocoder, :api_keys

    def mass_geocode(collection, api_key)
      collection.without_geocode.limit(LIMIT).each {|object| geocode(object, api_key) }
    end

    def geocode(object, api_key)
      update_geocode(object, geocoder.location_for(object.full_address, api_key))
    end

    def update_geocode(object, geocode_hash)
      consume_hash(object, geocode_hash) if geocoder.is_ok?(geocode_hash)
    end

    def consume_hash(object, geocode_hash)
      object.update_attributes(
          latitude: geocode_hash[:location][:lat],
          longitude: geocode_hash[:location][:lng]
      )
    end

  end
end