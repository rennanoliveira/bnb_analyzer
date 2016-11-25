require 'thor/rails'

class RoomTypes < Thor
  include Thor::Rails

  desc 'fix',
       'Associates AirBnb data to room types'
  def fix
    puts 'Associando Dados de private room...'
    ::AirBnb.where(room_type: 'Private room').update_all(room_type_id: ::RoomType::PRIVATE_ROOM)
    puts 'Associando Dados de Entire Home...'
    ::AirBnb.where(room_type: 'Entire home/apt').update_all(room_type_id: ::RoomType::ENTIRE_HOME)
    puts 'Associando Dados de Shared room...'
    ::AirBnb.where(room_type: 'Shared room').update_all(room_type_id: ::RoomType::SHARED_ROOM)
    puts 'Processo finalizado!'
  end

  desc 'fix_neighbourhoods',
       'Associates AirBnb data to Neighbourhoods'
  def fix_neighbourhoods
    puts 'Associando Neighbourhoods..'
    Neighbourhood.all.each do |neighbourhood|
      puts "Associando #{neighbourhood.name}"
      ::AirBnb.
          where(neighbourhood_cleansed: neighbourhood.name).
          update_all(neighbourhood_id: neighbourhood.id)
    end
    puts 'Processo finalizado!'
  end

end