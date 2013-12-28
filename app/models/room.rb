class Room < ActiveRecord::Base
  has_many :rented_rooms
  has_many :rents, through: :rented_rooms
end
