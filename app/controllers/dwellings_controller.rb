class DwellingsController < ApplicationController

  def index
    @mdr_filter = NYCData::Filter.new(params)
    @dwelling_stats = NYCData::Statistics.new(params)
  end

end
