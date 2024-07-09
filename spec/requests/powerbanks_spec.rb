require 'rails_helper'

RSpec.describe "Powerbanks", type: :request do
  let(:power_bank) { create(:power_bank) } 

  describe "GET /index" do
    it "returns http success" do
      get powerbanks_path
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET /new" do
    it "returns http success" do
      get new_powerbank_path
      expect(response).to have_http_status(:success)
    end
  end



  describe "GET /userpowerbanks" do
    it "returns http success" do
      get userpowerbanks_powerbanks_path
      expect(response).to have_http_status(:success)
    end
  end


end
