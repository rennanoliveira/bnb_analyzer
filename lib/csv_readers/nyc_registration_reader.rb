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

# {:boro=>"BROOKLYN", :block=>3199, :lot=>6, :bin=>3072758, :registration_id=>336487,
#  :building_id=>315974, :boro_id=>3, :house_number=>73, :low_house_number=>73,
#  :high_house_number=>73, :address_street=>"IRVING AVENUE", :address_code=>52130,
#  :zip_code=>11237, :community_board=>4, :registered_on=>"05/14/2012", :registration_ends_on=>"09/15/2013"}