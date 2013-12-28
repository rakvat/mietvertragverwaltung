# join Rent and Room
class RentedRoom < ActiveRecord::Base
  belongs_to :rent
  belongs_to :room
end
