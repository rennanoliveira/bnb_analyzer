class AddNeighbourhoodGroupIdToMultipleDwellingRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :multiple_dwelling_registrations,
                  :neighbourhood_group_id,
                  :integer

    add_index :multiple_dwelling_registrations, :neighbourhood_group_id
  end
end
