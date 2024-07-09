require 'rails_helper'

RSpec.describe "Locations", type: :request do
  let(:location) { create(:location) }
  describe "GET /index" do
    it "returns http success" do
      get locations_path
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET /new" do
    it "returns http success" do
      get new_location_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new location and redirects" do
      post locations_path, params: { location: { address: "123 Main St" } }
      expect(response).to redirect_to(locations_path)
      expect(Location.last.address).to eq("123 Main St")
    end
  end


end
