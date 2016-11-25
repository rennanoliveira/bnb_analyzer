require_relative '../csv_readers/airbnb_reader'
require_relative '../csv_readers/nyc_registration_reader'

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

end