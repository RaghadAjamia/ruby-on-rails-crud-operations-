require 'rails_helper'

RSpec.describe "Stations", type: :request do
  let(:station) { create(:station) } # Assuming you have a FactoryBot factory for Station

  describe "GET /index" do
    it "returns http success" do
      get stations_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show/:id" do
    it "returns http success" do
      get station_path(station)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_station_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new station and redirects" do
        post stations_path, params: { station: { name: "New Station", status: "active", location_id: 1, warehouse_id: 1 } }
        expect(response).to redirect_to(station_path(Station.last))
        expect(Station.last.name).to eq("New Station")
      end
    end

    context "with invalid parameters" do
      it "does not create a new station and re-renders the new template" do
        post stations_path, params: { station: { name: "", status: "", location_id: nil, warehouse_id: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET /edit/:id" do
    it "returns http success" do
      get edit_station_path(station)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update/:id" do
    context "with valid parameters" do
      it "updates the station and redirects" do
        patch station_path(station), params: { station: { name: "Updated Station" } }
        expect(response).to redirect_to(station_path(station))
        station.reload
        expect(station.name).to eq("Updated Station")
      end
    end

    context "with invalid parameters" do
      it "does not update the station and re-renders the edit template" do
        patch station_path(station), params: { station: { name: "" } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "GET /userstations" do
    it "returns http success" do
      get userstations_stations_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy/:id" do
    it "destroys the station and redirects" do
      station = create(:station)
      delete station_path(station)
      expect(response).to redirect_to(stations_path)
      expect(Station.exists?(station.id)).to be_falsey
    end
  end
end
