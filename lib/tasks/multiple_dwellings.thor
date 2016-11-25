require 'thor/rails'

class MultipleDwellings < Thor
  include Thor::Rails

  desc 'associate_boro_groups',
       'Associates MDR data to Neighbourhood groups'
  def associate_boro_groups
    puts 'Associando Dados de Brooklyn...'
    ::MultipleDwellingRegistration.where(boro: 'BROOKLYN').
        update_all(neighbourhood_group_id: ::NeighbourhoodGroup::BROOKLYN)
    puts 'Associando Dados de Manhattan...'
    ::MultipleDwellingRegistration.where(boro: 'MANHATTAN').
        update_all(neighbourhood_group_id: ::NeighbourhoodGroup::MANHATTAN)
    puts 'Associando Dados de Bronx...'
    ::MultipleDwellingRegistration.where(boro: 'BRONX').
        update_all(neighbourhood_group_id: ::NeighbourhoodGroup::BRONX)
    puts 'Associando Dados de Queens...'
    ::MultipleDwellingRegistration.where(boro: 'QUEENS').
        update_all(neighbourhood_group_id: ::NeighbourhoodGroup::QUEENS)
    puts 'Associando Dados de Staten Island...'
    ::MultipleDwellingRegistration.where(boro: 'STATEN ISLAND').
        update_all(neighbourhood_group_id: ::NeighbourhoodGroup::STATEN_ISLAND)
    puts 'Processo finalizado!'
  end
end
