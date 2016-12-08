class DwellingsController < ApplicationController

  def index
    @mdr_filter = NYCData::Filter.new(params)
  end

end
