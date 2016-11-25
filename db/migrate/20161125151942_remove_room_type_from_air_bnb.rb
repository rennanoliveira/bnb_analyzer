class RemoveRoomTypeFromAirBnb < ActiveRecord::Migration[5.0]
  def change
    remove_column :air_bnbs, :room_type, :string
  end
end
