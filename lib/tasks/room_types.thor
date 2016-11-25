require_relative '../csv_readers/airbnb_reader'
require_relative '../csv_readers/nyc_registration_reader'

require 'thor/rails'

class RoomTypes < Thor
  include Thor::Rails

  desc 'fix',
       'Generates new room types'
  def airbnb(file_path)
    puts "Arquivo passado: #{file_path}"
    csv = ::CSVReaders::AirbnbReader.new(file_path)
    puts 'Lendo arquivo...'
    airbnb_hash = csv.to_hash
    puts 'Criando entradas...'
    ::AirBnb.create(airbnb_hash)
    puts 'Processo finalizado!'
  end

  desc 'nyc FILEPATH',
       'populates the MultipleDwellingRegistration database with the csv data from file'
  def nyc(file_path)
    puts "Arquivo passado: #{file_path}"
    csv = ::CSVReaders::NYCRegistrationReader.new(file_path)
    puts 'Lendo arquivo...'
    dwellings_hash = csv.to_hash
    puts 'Criando entradas...'
    ::MultipleDwellingRegistration.create(dwellings_hash)
    puts 'Processo finalizado!'
  end
end