require 'rails_helper'

RSpec.describe RoomType, type: :model do

  describe 'relations' do
    it { is_expected.to have_many :air_bnbs }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

end
