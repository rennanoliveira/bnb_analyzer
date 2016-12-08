module NYCData
  module ListingScopes

    def by_boro(boro)
      where(boro: boro)
    end

    def with_geocode
      where.not(latitude: nil)
    end

    def active
      where('registration_ends_on >= ?', Date.current)
    end

    def expired
      where('registration_ends_on < ?', Date.current)
    end

  end
end