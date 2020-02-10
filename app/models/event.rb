class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: 'events', foreign_key: 'creator_id'
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  scope :past, -> { where('time < ?', Time.zone.now) }
  scope :upcoming, -> { where('time >= ?', Time.zone.now) }
end
