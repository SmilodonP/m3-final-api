require 'rails_helper'

RSpec.describe "Tea Endpoints:", type: :request do
  let!(:customer) { create(:customer) }
  let!(:subscription) { create(:subscription, customer: customer) }
  let!(:tea) { create(:tea) }

  context "Tea #Index:" do
    describe "GET all teas" do
      it "returns all teas" do
        create_list(:tea, 4)

        get "/api/v1/teas"
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:ok)
        expect(json[:data].count).to eq(5)
        expect(json[:data].first).to include(:id, :type, :attributes)
        expect(json[:data].first[:attributes]).to include(:name, :description, :instruction, :price)
      end
    end
  end

  context "Tea #Show:" do
    describe "GET tea by id" do
      it "returns a single tea's information" do
        name = "Arizona"
        description = "Canned"
        instruction = "Crack 'er open and chug a lug!"
        price = 0.99
        can_of_tea = Tea.create!(name: name, description: description, instruction: instruction, price: price)

        get "/api/v1/teas/#{can_of_tea.id}"
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:ok)
        expect(json[:data]).to include(:id, :type, :attributes)
        expect(json[:data][:id]).to eq("#{can_of_tea.id}")
        expect(json[:data][:type]).to eq("tea")
        expect(json[:data][:attributes][:name]).to eq("Arizona")
        expect(json[:data][:attributes][:description]).to eq("Canned")
        expect(json[:data][:attributes][:instruction]).to eq("Crack 'er open and chug a lug!")
        expect(json[:data][:attributes][:price]).to eq(0.99)
      end
    end

    it "returns 404 and error message when tea is not found" do
      get "/api/v1/teas/0"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:not_found)
      expect(json[:message]).to eq("Your query could not be completed")
      expect(json[:errors]).to be_an Array
      expect(json[:errors].first).to eq("Couldn't find Tea with 'id'=0")
    end
  end

  describe "Adding tea to subscription from show page" do
    context 'when the tea is successfully added' do
      it "allows the user to add the tea to their subscription" do
        post "/api/v1/subscriptions/#{subscription.id}/add_tea", params: { tea_id: tea.id }
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:ok)
        expect(json[:data][:id]).to eq(subscription.id.to_s)
        expect(json[:data][:relationships][:teas][:data].count).to eq(1) 
      end
    end

    context 'when the tea does not exist' do
      it 'returns a Tea not found error' do
        post "/api/v1/subscriptions/#{subscription.id}/add_tea", params: { tea_id: 0 }
        
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:not_found)
        expect(json[:message]).to eq("Your query could not be completed")
        expect(json[:errors].first).to eq("Tea not found")
      end
    end
  end
end