class Rent < ActiveRecord::Base
  has_many :rented_rooms
  has_many :rooms, through: :rented_rooms
  belongs_to :tenant

  attr_accessor :heating_charges, :assessory_charges

  def self.all_current_at(date)
    current_contracts = []
    rooms = Room.all
    rooms.each do |room|
      rents = room.rents.order('start').reverse
      rents.each do |rent|
        if date >= rent.start
          unless rent.tenant.nil? # wenn nicht Leerstand
            current_contracts << rent 
          end
          break
        end
      end
    end
    current_contracts
  end

  def sum_assessory_charges
    self.heating_charges.round(2) + self.assessory_charges.round(2)
  end


  def sum_rent
    self.basic_rent.round(2) + sum_assessory_charges.round(2)
  end

  def square_meters
    rooms.inject(0) { |a,b| a + b.square_meters }
  end
end
