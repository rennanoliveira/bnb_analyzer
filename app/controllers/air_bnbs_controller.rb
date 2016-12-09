class AirBnbsController < ApplicationController

  def index
    @air_bnb_filter = Bnb::Filter.new(params)
    @air_bnb_stats = Bnb::Statistics.new(params)
  end

end
