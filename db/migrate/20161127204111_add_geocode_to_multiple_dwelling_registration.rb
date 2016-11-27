class AddGeocodeToMultipleDwellingRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :multiple_dwelling_registrations, :latitude, :decimal, { precision: 10, scale: 6 }
    add_column :multiple_dwelling_registrations, :longitude, :decimal, { precision: 10, scale: 6 }
  end
end
