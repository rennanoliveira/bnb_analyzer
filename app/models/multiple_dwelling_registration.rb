class MultipleDwellingRegistration < ApplicationRecord

  belongs_to :neighbourhood_group

  validates :registration_id,
            :boro,
            :boro_id,
            :block,
            :lot,
            :bin,
            :building_id,
            :house_number,
            :low_house_number,
            :high_house_number,
            :zip_code,
            :address_street,
            :address_code,
            :community_board,
            :registered_on,
            :registration_ends_on, presence: true

end
