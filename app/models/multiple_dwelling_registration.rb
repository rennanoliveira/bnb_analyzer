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

  scope :without_geocode, -> {
    where(latitude: nil)
  }

  delegate :name, to: :neighbourhood_group, prefix: true

  def full_address
    "#{house_number} #{address_street}, #{boro}, NYC, #{zip_code}"
  end

end
