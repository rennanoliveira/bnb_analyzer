module Bnb
  module GroupingScopes

    def grouped_by_property_types
      joins(:property_type).
          group('property_types.name').
          count(:id)
    end

    def grouped_by_neighbourhood_group
      joins(neighbourhood: :neighbourhood_group).
          group('neighbourhood_groups.name').
          count(:id)
    end

    def grouped_by_neighbourhood
      joins(:neighbourhood).
          group('neighbourhoods.name').
          count(:id)
    end

    def grouped_by_room_types
      joins(:room_type).
          group('room_types.name').
          count(:id)
    end

    def without_ratings
      where(review_scores_rating: nil).count
    end

    def between_ratings(rating_start, rating_end)
      where('review_scores_rating between ? and ?', rating_start, rating_end).count
    end

    def top_hosts(quantity)
      group(:host_id).count(:id).values.sort.reverse.first(quantity)
    end

  end
end


