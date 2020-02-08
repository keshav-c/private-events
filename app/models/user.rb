class User < ApplicationRecord
  has_many :events , inverse_of: 'creator', foreign_key: 'creator_id'
  validates :name, uniqueness: true
end
