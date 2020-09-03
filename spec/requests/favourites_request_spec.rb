require 'rails_helper'

RSpec.describe 'Favourites', type: :request do
  let!(:user) { create(:user) }
  let!(:services) { create_list(:service, 10) }
  let(:user_id) { users.first.id }
  let(:service_id) { services.first.id }

  describe 'mark a service as favourite ' do
    before { post "/services/#{service_id}/"}
  end
end
