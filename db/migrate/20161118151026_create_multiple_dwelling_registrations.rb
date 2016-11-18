class CreateMultipleDwellingRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :multiple_dwelling_registrations do |t|
      t.integer :registration_id
      t.string :boro
      t.integer :boro_id
      t.integer :block
      t.integer :lot
      t.integer :bin
      t.integer :building_id
      t.integer :house_number
      t.integer :low_house_number
      t.integer :high_house_number
      t.string :address_street
      t.integer :address_code
      t.integer :zip_code
      t.integer :community_board
      t.date :registered_on
      t.date :registration_ends_on

      t.timestamps
    end
  end
end
