class NeighbourhoodGroup < ApplicationRecord

  has_many :neighbourhoods
  has_many :air_bnbs, through: :neighbourhoods

  validates :name, presence: true, uniqueness: true

end
