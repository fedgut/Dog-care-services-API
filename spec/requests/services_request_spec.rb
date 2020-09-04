require 'rails_helper'

RSpec.describe 'Services', type: :request do
  # initialize test data
  let!(:user) { create(:user) }
  let!(:services) { create_list(:service, 10) }
  let(:service_id) { services.first.id }
  let(:headers) { valid_headers }
  let(:valid_attributes) do
    {
      title: 'Test-service-title',
      description: 'Test-service-description',
      image_url: 'https://www.generic.com/images/image.jpg',
      price: '10.50'
    }.to_json
  end

  # Test suite for GET /services
  describe 'GET /services' do
    before { get '/services', headers: headers }

    it 'return all services' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /services/:id

  describe 'GET /services/:id' do
    before { get "/services/#{service_id}", headers: headers }

    context 'When the record exist' do
      it 'return a specific service' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(service_id)
      end

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'When the reccord does not exist' do
      let(:service_id) { 100 }
      it 'returns a status code 404 ' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(json).to eq({ 'message' => "Couldn't find Service with 'id'=100" })
      end
    end
  end

  # Test suite for PUT /services/:id
  describe 'PUT /services/:id' do
    context 'when the record exists' do
      before { put "/services/#{service_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # test suite for destroying services
  describe 'Delete services/:id' do
    before { delete "/services/#{service_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  # Test suite for POST /services
  describe 'POST /services' do

    context 'when the request is valid' do
      before { post '/services', params: valid_attributes, headers: headers }

      it 'creates a service' do
        expect(json['title']).to eq('Test-service-title')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/services', params: { 'title': '' }.to_json, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: /)
      end
    end
  end
end
