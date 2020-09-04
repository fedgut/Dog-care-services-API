require 'acceptance_helper'

# rubocop:disable Metrics/BlockLength

resource 'Service', acceptance: true do
  let!(:user) { create(:user) }
  let!(:service) { create(:service) }
  before do
    header 'Authorization', token_generator(user.id)
    header 'Content-Type', 'application/json'
  end

  get '/services' do
    example_request 'Listing services' do
      explanation 'List all the services'
      expect(status).to eq 200
    end
  end

  get '/services/:service_id' do
    example_request 'See a service in detail' do
      explanation 'See all the details of a specific service' do
        expect(status).to eq 200
      end
    end
  end

  post '/services/' do
    route_summary 'This is used to create a new service'

    parameter title: 'Service title'
    parameter description: 'In depth description of the service'
    parameter image_url: 'An image to ilustrate the service'
    parameter price: 'The monetary value of the service'

    example_request 'Create a service' do
      explanation 'Admin users can create new services' do
        expect(status).to eq 204
      end
    end
  end

  put '/services/:id' do
    route_summary 'This is used to update a service'

    parameter title: 'Update the service title'
    parameter description: 'Update the in depth description of the service'
    parameter image_url: 'Update the image to ilustrate the service'
    parameter price: 'Update the monetary value of the service'

    example_request 'Update a service' do
      explanation 'Admin users can update the fields of a service' do
        expect(status).to eq 204
      end
    end
  end

  delete '/services/:id' do
    route_summary 'This is used to deleta a service entry'

    example_request 'Delete a service' do
      explanation 'Admin users can delete a service' do
        expect(status).to eq 204
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
