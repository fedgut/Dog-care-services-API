require 'acceptance_helper'

resource 'Authentication', acceptance: true do
  let(:user) { create(:user) }
end
