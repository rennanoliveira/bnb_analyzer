class AddNeighbourhoodGroupIdToNeighbourhood < ActiveRecord::Migration[5.0]
  def change
    add_column :neighbourhoods, :neighbourhood_group_id, :integer
    add_index :neighbourhoods, :neighbourhood_group_id
  end
end
