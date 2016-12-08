class GeocodersController < ApplicationController

  def show
    @geocode_statistics = NYCData::GeocodeStatistics.new
  end

end
