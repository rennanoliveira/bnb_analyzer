class AirBnb < ApplicationRecord

  validates :latitude, presence: true
  validates :longitude, presence: true
  

end
