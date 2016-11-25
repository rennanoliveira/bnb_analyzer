require 'rails_helper'

RSpec.describe MultipleDwellingRegistration, type: :model do

  describe 'relations' do
    it { is_expected.to belong_to :neighbourhood_group }
  end

  describe 'validations' do
    [:registration_id,
     :boro,
     :boro_id,
     :block,
     :lot,
     :bin,
     :building_id,
     :house_number,
     :low_house_number,
     :high_house_number,
     :zip_code,
     :address_street,
     :address_code,
     :community_board,
     :registered_on,
     :registration_ends_on].each do |attr|
      it { is_expected.to validate_presence_of attr }
    end
  end
end
