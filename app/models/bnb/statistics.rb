module Bnb
  class Statistics

    attr_reader :neighbourhood_group

    def initialize(attributes, collection=AirBnb.all)
      @collection = collection.extending(ListingScopes, GroupingScopes)
      @neighbourhood_group = attributes[:neighbourhood_group]
    end

    def total
      base_query.count
    end

    def by_minimum_nights
      {
          less_than_3_days: base_query.minimum_nights_less_than(3).count(:id),
          less_than_a_month: base_query.minimum_nights_less_than(30).count(:id)
      }
    end

    def by_property_type
      base_query.grouped_by_property_types
    end

    def by_neighbourhood
      return base_query.grouped_by_neighbourhood_group unless neighbourhood_group.present?
      base_query.grouped_by_neighbourhood
    end

    def by_room_type
      base_query.grouped_by_room_types
    end

    def by_stars
      {
          'Unrated' => base_query.without_ratings,
          'One Star' => base_query.between_ratings(0, 20),
          'Two Stars' => base_query.between_ratings(21, 40),
          'Three Stars' => base_query.between_ratings(41, 60),
          'Four Stars' => base_query.between_ratings(61, 80),
          'Five Stars' => base_query.between_ratings(81, 100)
      }
    end

    def top_hosts
      base_query.top_hosts(5).map
    end

    private

    def base_query
      return @collection unless neighbourhood_group.present?
      @collection.by_neighbourhood_group(neighbourhood_group)
    end

  end
end