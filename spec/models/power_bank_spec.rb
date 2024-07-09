require 'rails_helper'

RSpec.describe PowerBank, type: :model do
  describe "associations" do
    it { should belong_to(:locatable) }
  end

  describe "validations" do
    it { should validate_inclusion_of(:status).in_array(%w[in_use available]) }

    context "when locatable is a Station" do
      it "is not valid if the station already has 10 power banks" do
        station = create(:station)
        create_list(:power_bank, 10, locatable: station)
        power_bank = build(:power_bank, locatable: station)
        expect(power_bank).not_to be_valid
        expect(power_bank.errors[:base]).to include("Station cannot have more than 10 power banks")
      end

      it "is valid if the station has less than 10 power banks" do
        station = create(:station)
        create_list(:power_bank, 9, locatable: station)
        power_bank = build(:power_bank, locatable: station)
        expect(power_bank).to be_valid
      end
    end

    context "when locatable is not a Station" do
      it "is valid regardless of the number of power banks" do
        warehouse = create(:warehouse)
        create_list(:power_bank, 10, locatable: warehouse)
        power_bank = build(:power_bank, locatable: warehouse)
        expect(power_bank).to be_valid
      end
    end
  end

  describe "custom validations" do
    let(:station) { create(:station) }
    let(:warehouse) { create(:warehouse) }

    it "validates station_power_banks_within_limit when locatable_type is 'Station'" do
      allow(subject).to receive(:locatable_type).and_return('Station')
      allow(subject).to receive(:locatable).and_return(station)
      allow(station).to receive(:power_banks).and_return(double(size: 10))

      subject.valid?
      expect(subject.errors[:base]).to include("Station cannot have more than 10 power banks")
    end

    it "does not validate station_power_banks_within_limit when locatable_type is not 'Station'" do
      allow(subject).to receive(:locatable_type).and_return('Warehouse')
      allow(subject).to receive(:locatable).and_return(warehouse)
      
      subject.valid?
      expect(subject.errors[:base]).not_to include("Station cannot have more than 10 power banks")
    end
  end
end
