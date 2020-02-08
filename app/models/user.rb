class User < ApplicationRecord
  has_many :events, inverse_of: 'creator' 
  validates :name, uniqueness: true
end
