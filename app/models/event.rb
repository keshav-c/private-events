class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: 'events',  foreign_key: "creator_id"
end
