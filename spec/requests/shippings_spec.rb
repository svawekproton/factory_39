require "rails_helper"

RSpec.describe "ShippingsController", type: :request do
  describe "GET /quote" do
    it "return shipping cost" do
      get "/quote", params: { "from": "EC2A3LT", "to": "NW88TE", "vehicle": "bicycle" }

      expect(response).to_have_status(:success)
      expect(response).to eq({ "from": "EC2A3LT", "to": "NW88TE", "vehicle": "bicycle", "price": 29.76 })
    end
  end
end
