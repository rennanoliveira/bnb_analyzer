class AddRoomTypeIndexToAirBnb < ActiveRecord::Migration[5.0]
  def change
    add_index :air_bnbs, :room_type_id
  end
end
