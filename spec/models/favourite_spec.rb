require 'rails_helper'

RSpec.describe Favourite, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:service) }
end
