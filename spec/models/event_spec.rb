require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it do
      should belong_to(:creator)
        .class_name('User')
        .with_foreign_key('creator_id')
    end
    it do
      should have_many(:attendees)
        .class_name('User')
        .through(:attendances)
        .source(:user)
    end
  end
end
