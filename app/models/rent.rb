class Rent < ActiveRecord::Base
  belongs_to :room
  belongs_to :tenant

  attr_accessor :heating_charges, :assessory_charges

  def self.all_current_at(date)
    current_contracts = []
    rooms = Room.all
    rooms.each do |room|
      rents = room.rents.order('start')
      rents.each do |rent|
        current_contracts << rent if date >= rent.start
      end
    end
    current_contracts
  end

  def sum_assessory_charges
    self.heating_charges + self.assessory_charges
  end


  def sum_rent
    self.basic_rent + sum_assessory_charges
  end
end
