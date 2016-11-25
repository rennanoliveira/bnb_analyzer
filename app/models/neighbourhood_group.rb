class NeighbourhoodGroup < ApplicationRecord

  BROOKLYN = 1
  MANHATTAN = 2
  BRONX = 3
  QUEENS = 4
  STATEN_ISLAND = 5

  has_many :neighbourhoods
  has_many :air_bnbs, through: :neighbourhoods
  has_many :multiple_dwelling_registrations

  validates :name, presence: true, uniqueness: true

end
