require 'rails_helper'

RSpec.describe NeighbourhoodGroup, type: :model do

  describe 'relations' do
    it { is_expected.to have_many :multiple_dwelling_registrations }
    it { is_expected.to have_many :neighbourhoods }
    it { is_expected.to have_many(:air_bnbs).
        through(:neighbourhoods) 
    }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

end
