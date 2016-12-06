class PropertyType < ApplicationRecord

  has_many :air_bnbs

  validates :name, presence: true, uniqueness: true

end
