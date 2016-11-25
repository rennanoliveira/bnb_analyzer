require 'rails_helper'

RSpec.describe AirBnb, type: :model do

  describe 'relations' do
    it { is_expected.to belong_to :room_type }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :latitude }
    it { is_expected.to validate_presence_of :longitude }
  end

end