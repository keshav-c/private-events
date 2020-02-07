class User < ApplicationRecord
  validates :name, uniqueness: true
end
