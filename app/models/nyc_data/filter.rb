module NYCData
  class Filter

    ACTIVE = 1
    EXPIRED = 2

    def initialize(params)
      @page = set_page(params[:page])
      @boro = params[:boro]
      @geocode = params[:geocode]
      @situation = params[:situation]
    end

    def dwellings
      @dwellings ||= base_query.page(page)
    end

    def boros
      NeighbourhoodGroup.all.pluck(:name).map &:upcase
    end

    def situations
      [['Active', 1], ['Expired', 2]]
    end

    private

    attr_reader :page, :boro, :geocode, :situation

    def base_query
      dwellings = MultipleDwellingRegistration.all.
          extending(ListingScopes)
      dwellings = dwellings.by_boro(boro) if boro.present?
      dwellings = dwellings.with_geocode if geocode.present?
      dwellings = dwellings.active if situation && situation == '1'
      dwellings = dwellings.expired if situation && situation == '2'
      dwellings
    end

    def set_page(page)
      page.present? ? page : 1
    end

  end
end