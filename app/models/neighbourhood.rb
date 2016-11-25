class Neighbourhood < ApplicationRecord

  validates :name, presence: true, uniqueness: true

end
