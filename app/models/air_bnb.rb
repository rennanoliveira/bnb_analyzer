class AirBnb < ApplicationRecord

  belongs_to :room_type

  validates :latitude, presence: true
  validates :longitude, presence: true
  

end
