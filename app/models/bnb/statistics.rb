module Bnb
  class Statistics

    def initialize(attributes, collection=AirBnb.all)
      @collection = collection.extending(ListingScopes, GroupingScopes)
      @neighbourhood_group_id = attributes[:neighbourhood_group_id]
    end

    def by_minimum_nights
      {
          less_than_3_days: base_query.minimum_nights_less_than(3),
          less_than_a_month: base_query.minimum_nights_less_than(30)
      }
    end

    def by_property_type
      base_query.grouped_by_property_types
    end

    private

    def base_query
      return @collection unless @neighbourhood_group_id
      @collection.by_neighbourhood_group(@neighbourhood_group_id)
    end

  end
end