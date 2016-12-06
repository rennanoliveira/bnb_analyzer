module Geocoders
  class MassGeocoder2

    LIMIT = 2_500

    def initialize(geocoder=GoogleMaps, api_keys)
      @geocoder = geocoder.new
      @api_keys = api_keys
    end

    def run(collection)
      keys = api_keys.dup
      while keys.any?
        mass_geocode(collection, keys.pop)
      end
    end

    private

    # TODO: Protect from net failures.

    attr_reader :geocoder, :api_keys

    def mass_geocode(collection, api_key)
      collection.without_geocode.limit(LIMIT).each do |object|
        geocode_hash = geocoder.location_for(object.full_address, api_key)
        return unless geocoder.is_ok?(geocode_hash)
        update_geocode(object, geocode_hash)
      end
    end

    def update_geocode(object, geocode_hash)
      object.update_attributes(
          latitude: geocode_hash[:location][:lat],
          longitude: geocode_hash[:location][:lng]
      )
    end

  end
end


['AIzaSyBDy46GuSVOpx9FewH8SJw_IzPc_WAYbAo',
    'AIzaSyDNbbuuK92i_dy57w-kji6ZMEjZFh0yg9k',
    'AIzaSyA6mFii_zkYKfxEJcYVZOOjAWhaqce5yxc',
    'AIzaSyDdnetPlnnlnzjH5YFjggYyFH8i4HKOzns',
    'AIzaSyCJDLUQeHvJ7PWoUjRM9zbUKjCie7XkBEw',
    'AIzaSyAcXx4OoLDSlnEAaaCkFXFPk3bogNwxPuY',
    'AIzaSyCNkXEJ88kidLYlpy7S9hNK7x-GAWNs_y0',
    'AIzaSyDm4lbo5-Rns5DweNapcQ5HGpMC6C1Nacs']