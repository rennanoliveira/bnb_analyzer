module Bnb
  class Filter

    def initialize(params)
      @page = set_page(params[:page])
      @minimum_nights = params[:minimum_nights]
      @neighbourhood_group = params[:neighbourhood_group]
      @minimum_rating = params[:minimum_rating]
      @room_type = params[:room_type]
    end

    def bnbs
      base_query.page(page)
    end

    def statistics
      # Ranking::base_query
    end

    def neighbourhood_groups
      NeighbourhoodGroup.all
    end

    def room_types
      RoomType.all
    end

    private

    attr_reader :page, :minimum_nights, :neighbourhood_group, :minimum_rating, :room_type

    def base_query
      @bnbs = AirBnb.all.extending(ListingScopes).includes(:room_type).page(page)
      @bnbs = @bnbs.by_neighbourhood_group(neighbourhood_group) if neighbourhood_group.present?
      @bnbs = @bnbs.minimum_nights_less_than(minimum_nights) if minimum_nights.present?
      @bnbs = @bnbs.rating_is_at_least(minimum_rating) if minimum_rating.present?
      @bnbs = @bnbs.by_room_type(room_type) if room_type.present?
      @bnbs
    end

    def set_page(page)
      page.present? ? page : 1
    end

  end
end