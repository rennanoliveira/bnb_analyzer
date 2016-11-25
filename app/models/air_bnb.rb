class AirBnb < ApplicationRecord

  belongs_to :room_type
  belongs_to :neighbourhood

  validates :latitude, presence: true
  validates :longitude, presence: true
  

end
