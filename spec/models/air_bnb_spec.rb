require 'rails_helper'

RSpec.describe AirBnb, type: :model do

  describe 'relations' do
    it { is_expected.to belong_to :room_type }
    it { is_expected.to belong_to :property_type }
    it { is_expected.to belong_to :neighbourhood }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :latitude }
    it { is_expected.to validate_presence_of :longitude }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to(:property_type).with_prefix }
    it { is_expected.to delegate_method(:name).to(:room_type).with_prefix }

  end

end