module Bnb
  module ListingScopes

    def by_neighbourhood_group(group_id)
      joins(:neighbourhood).
          where(neighbourhoods: {neighbourhood_group_id: group_id})
    end

    def minimum_nights_less_than(number_of_nights)
      where('minimum_nights <= ?', number_of_nights)
    end

    def rating_is_at_least(minimum_rating)
      where('review_scores_rating >= ?', minimum_rating)
    end

  end
end