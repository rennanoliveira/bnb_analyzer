require 'rails_helper'

RSpec.describe Neighbourhood, type: :model do

  describe 'relations' do
    it { is_expected.to belong_to :neighbourhood_group }
    it { is_expected.to have_many :air_bnbs }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

end
