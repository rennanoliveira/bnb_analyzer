class PropertyType < ApplicationRecord

  UNDEFINED = 3

  has_many :air_bnbs

  validates :name, presence: true, uniqueness: true

end
