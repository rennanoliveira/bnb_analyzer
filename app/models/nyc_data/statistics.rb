module NYCData
  class Statistics

    attr_reader :neighbourhood_group

    def initialize(attributes)
      @boro = attributes[:boro]
    end

    def total
      base_query.count
    end

    def total_active
      base_query.active.count
    end

    def by_situation
      {
          'Active' => total_active,
          'Expired' => total - total_active
      }
    end

    private

    attr_reader :boro

    def base_query
      dwellings = MultipleDwellingRegistration.all.
          extending(ListingScopes)
      dwellings = dwellings.by_boro(boro) if boro.present?
      dwellings
    end

  end
end