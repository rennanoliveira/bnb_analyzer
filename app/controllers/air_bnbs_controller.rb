class AirBnbsController < ApplicationController

  def index
    @air_bnb_filter = Bnb::Filter.new(params)
  end

end
