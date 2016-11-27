require 'uri'

module Geocoders
  class GoogleMaps
    include HTTParty
    base_uri 'https://maps.googleapis.com/maps/api'

    def location_for(address_string, key)
      formatted_response(
          self.class.get('/geocode/json', query: {address: address_string.gsub(' ', '+'), key: key}).
              parsed_response)
    end

    private

    def formatted_response(response)
      result = ActiveSupport::HashWithIndifferentAccess.new(status: response['status'])
      if response['status'] == 'OK'
        result[:location] = response['results'][0]['geometry']['location']
      end
      result
    end
  end
end