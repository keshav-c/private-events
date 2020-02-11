require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should belong_to(:creator) }
    it { should have_many(:attendees) }
  end
end
