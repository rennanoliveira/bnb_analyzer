class AddPropertyTypeIdToAirBnb < ActiveRecord::Migration[5.0]
  def change
    add_reference :air_bnbs, :property_type, index: true
  end
end
