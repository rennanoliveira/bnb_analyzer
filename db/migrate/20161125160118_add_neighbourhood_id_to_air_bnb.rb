class AddNeighbourhoodIdToAirBnb < ActiveRecord::Migration[5.0]
  def change
    add_column :air_bnbs, :neighbourhood_id, :integer
    add_index :air_bnbs, :neighbourhood_id
  end
end
