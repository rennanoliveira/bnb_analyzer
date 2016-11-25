class AddRoomTypeIdToAirBnb < ActiveRecord::Migration[5.0]

  def change
    add_column :air_bnbs, :room_type_id, :integer
  end

end
