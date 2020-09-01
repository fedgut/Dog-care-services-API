require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:favourites).dependent(:destroy) }
  it { should have_many(:services).through(:favourites) }
  it { should validate_presence_of(:admin) }
  it { should validate_presence_of(:name) }
end
