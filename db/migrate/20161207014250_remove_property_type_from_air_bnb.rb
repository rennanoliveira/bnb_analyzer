class RemovePropertyTypeFromAirBnb < ActiveRecord::Migration[5.0]
  def change
    remove_column :air_bnbs, :property_type, :string
  end
end
