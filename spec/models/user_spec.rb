require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:events).with_foreign_key('creator_id') }
    it do
      should have_many(:attended_events)
        .class_name('Event')
        .through(:attendances)
        .source(:event)
    end
  end
end
