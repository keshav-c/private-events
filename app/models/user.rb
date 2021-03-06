class User < ApplicationRecord
  has_many :events, inverse_of: 'creator', foreign_key: 'creator_id'
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
  validates :name, uniqueness: true
end
