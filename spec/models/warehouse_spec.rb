require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe "associations" do
    it { should belong_to(:location) }
    it { should have_many(:stations) }
    it { should have_many(:power_banks) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
  end
end
