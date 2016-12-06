class AirBnb < ApplicationRecord

  belongs_to :neighbourhood
  belongs_to :property_type
  belongs_to :room_type

  validates :latitude, presence: true
  validates :longitude, presence: true

  delegate :name, to: :property_type, prefix: true, allow_nil: true
  delegate :name, to: :room_type, prefix: true

end
