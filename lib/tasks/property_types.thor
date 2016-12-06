require 'thor/rails'

class PropertyTypes < Thor
  include Thor::Rails

  desc 'fix',
       'Associates AirBnb data to property types'

  def fix
    ::PropertyType.all.each do |property_type|
      puts "Associando bnbs de #{property_type.name}"
      ::AirBnb.where(property_type: property_type.name).update_all(property_type_id: property_type.id)
    end

    ::AirBnb.where(property_type: nil).update_all(property_type_id: ::PropertyType::UNDEFINED)
  end


end