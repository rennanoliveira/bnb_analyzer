module Bnb
  class Filter

    def initialize(params)
      @page = set_page(params[:page])
      @minimum_nights = params[:minimum_nights]
      @neighbourhood_group = params[:neighbourhood_group]
      @minimum_rating = params[:minimum_rating]
    end

    def bnbs
      base_query.page(page)
    end

    def neighbourhood_groups
      NeighbourhoodGroup.all
    end

    private

    attr_reader :page, :minimum_nights, :neighbourhood_group, :minimum_rating

    def base_query
      @bnbs = AirBnb.all.extending(Bnb::ListingScopes).page(page)
      @bnbs = @bnbs.by_neighbourhood_group(neighbourhood_group) if neighbourhood_group.present?
      @bnbs = @bnbs.minimum_nights_less_than(minimum_nights) if minimum_nights.present?
      @bnbs = @bnbs.rating_is_at_least(minimum_rating) if minimum_rating.present?
      @bnbs
    end

    def set_page(page)
      page.present? ? page : 1
    end

  end
end