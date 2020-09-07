require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should have_many(:favourites).dependent(:destroy) }
  it { should have_many(:users).through(:favourites) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:image_url) }
  it { should validate_presence_of(:price) }
end
