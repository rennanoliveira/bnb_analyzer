require 'csv'

module CSVReaders
  class NYCRegistrationReader

    # Listing only the headers we want
    RENAMINGS = {
        registrationid: :registration_id,
        buildingid: :building_id,
        boroid: :boro_id,
        housenumber: :house_number,
        lowhousenumber: :low_house_number,
        highhousenumber: :high_house_number,
        streetname: :address_street,
        streetcode: :address_code,
        zip: :zip_code,
        communityboard: :community_board,
        lastregistrationdate: :registered_on,
        registrationenddate: :registration_ends_on
    }

    def initialize(path)
      @path = path
    end

    def to_hash
      csv.map do |enum|
        hash = enum.to_h
        hash.keys.each do |k|
          hash[RENAMINGS[k]] = hash.delete(k) if RENAMINGS[k]
        end
        hash
      end
    end

    private

    def csv
      @csv ||= CSV.read(@path, headers: true, header_converters: :symbol, converters: [:all])
    end

  end
end