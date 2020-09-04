require 'rails_helper'

RSpec.describe 'Favourites', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let!(:service) { create(:service) }
  let(:service_id) { service.id }
  let!(:favourite) { create(:favourite) }
  let(:headers) { valid_headers }

  describe ' Get user favourites ' do
    before { get "/users/#{user_id}/favourites", headers: headers }
    it 'Returns user favourites' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /users/:user_id/favourites
  describe 'POST  a favourite' do
    let(:valid_attributes) { { service_id: service_id }.to_json }

    context 'With valid params' do
      before { post "/users/#{user_id}/favourites", params: valid_attributes, headers: headers }

      it 'creates a fav with correct ids' do
        expect(json['user_id']).to eq(user_id)
        expect(json['service_id']).to eq(service_id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid params' do
      before { post "/users/#{user_id}/favourites", params: {}, headers: headers }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: /)
      end
    end
  end

  describe 'Destroys a specific fav' do
    before { delete "/users/#{user_id}/favourites/#{favourite.id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
