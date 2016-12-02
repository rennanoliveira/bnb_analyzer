module Bnb
  class Filter

    def initialize(params)
      @page = set_page(params[:page])

    end

    def bnbs
      AirBnb.page(page)
    end

    private

    attr_reader :page

    def set_page(page)
      page.present? ? page : 1
    end

  end
end