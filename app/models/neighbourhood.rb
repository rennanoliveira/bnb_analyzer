class Neighbourhood < ApplicationRecord

  has_many :air_bnbs
  belongs_to :neighbourhood_group

  validates :name, presence: true, uniqueness: true

end
