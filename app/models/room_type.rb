class RoomType < ApplicationRecord

  PRIVATE_ROOM = 1
  ENTIRE_HOME = 2
  SHARED_ROOM = 3

  has_many :air_bnbs

  validates :name, presence: true, uniqueness: true

end
