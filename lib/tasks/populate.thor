require_relative '../csv_ext/csv_reader'
require 'thor/rails'

class Populate < Thor
  include Thor::Rails
  desc 'airbnb FILEPATH',
       'populates the AirBnb database with the csv data from file'

  def airbnb(file_path)
    ::AirBnb.count
    puts "Arquivo passado: #{file_path}"
    csv = ::CSVExt::CSVReader.new(file_path)
    puts 'Lendo arquivo...'
    airbnb_hash = csv.to_hash
    puts 'Criando entradas...'
    ::AirBnb.create(airbnb_hash)
    puts 'Processo finalizado!'
  end
end