require 'acceptance_helper'

resource 'Authentication', acceptance: true do
  let!(:user) { create(:user) }
  before do
    header 'Content-Type', 'application/json'
  end

  post '/signup' do
    route_summary 'Create a users.'

    parameter :name, 'User name'
    parameter :email, 'User email'
    parameter :password, 'User password'
    parameter :password_confirmation, 'User password confirmation'

    example_request 'Creating a new  User' do
      explanation 'Registers a new user in the database'
      do_request(name: 'Eduardo', email: 'some@mail.com', password: 'foobar', password_confirmation: 'foobar')
      expect(status).to eq(201)
    end
  end

  post '/auth/login' do
    route_summary 'Login users.'

    parameter :email, 'User email'
    parameter :password, 'User password'

    example_request 'Creating a new token' do
      explanation 'Logs in a registered user.'
      do_request(email: user.email, password: user.password)
      expect(status).to eq(200)
    end
  end
end
