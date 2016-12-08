module Bnb
  module GroupingScopes

    def grouped_by_property_types
      joins(:property_type).
          group('property_types.name').
          count(:id)
    end

  end
end


