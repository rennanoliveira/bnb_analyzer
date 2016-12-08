module NYCData
  class GeocodeStatistics

    def total_data
      @total_data ||= NeighbourhoodStatistics.new
    end

    def per_neighbourhood_group
      @per_group_array ||= NeighbourhoodGroup.all.map do |group|
        {name: group.name,
         stats: NeighbourhoodStatistics.new(
             MultipleDwellingRegistration.where(neighbourhood_group_id: group.id)
         )}
      end
    end

  end
end
