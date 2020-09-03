require 'rails_helper'

RSpec.describe 'Favourites', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let!(:service) { create(:service) }
  let(:service_id) { service.id }
  let!(:favourite) { create(:favourite) }

  describe ' Get user favourites ' do
    before { get "/users/#{user_id}/favourites" }
    it 'Returns user favourites' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'Destroys a specific fav' do
    before { delete "/users/#{user_id}/favourites/#{favourite.id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
