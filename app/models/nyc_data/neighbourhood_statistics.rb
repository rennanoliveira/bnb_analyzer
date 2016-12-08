module NYCData
  class NeighbourhoodStatistics

    def initialize(collection = MultipleDwellingRegistration)
      @collection = collection
    end

    def total_data
      @total_data ||= @collection.count
    end

    def converted_data
      @converted_data ||= @collection.where.not(latitude: nil).count
    end

    def conversion_percentage
      @percentage ||= converted_data/total_data.to_f * 100
    end

  end
end
