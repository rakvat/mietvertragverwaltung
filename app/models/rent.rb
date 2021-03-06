class Rent < ActiveRecord::Base
  has_many :rented_rooms
  has_many :rooms, through: :rented_rooms
  belongs_to :tenant
  belongs_to :rents, class_name: :previous_rent

  attr_accessor :total_square, :heating_charges, :assessory_charges

  def self.create_nested(params)
    room_ids = params.delete('room_ids')
    rent = Rent.new(params)
    rent.rooms = []
    room_ids.each do |id|
      next if id == ''
      rent.rooms << Room.find(id.to_i)
    end
    rent
  end

  def nested_update(params)
    room_ids = params.delete('room_ids')
    self.update(params)
    self.rooms = []
    room_ids.each do |id|
      next if id == ''
      self.rooms << Room.find(id.to_i)
    end
  end

  def self.all_current_at(date)
    current_contracts = {}
    rooms = Room.all
    rooms.each do |room|
      rents = room.rents.order('start').reverse
      rents.each do |rent|
        if date >= rent.start
          unless rent.tenant.nil? # wenn nicht Leerstand
            current_contracts[rent.id] = rent 
          end
          break
        end
      end
    end
    current_contracts.values
  end

  def sum_assessory_charges
    heating = self.heating_charges
    assessory = self.assessory_charges
    unless self.custom_heating.nil?
      heating = self.custom_heating
    end
    unless self.custom_assessory.nil?
      assessory = self.custom_assessory
    end
    (heating.round(2) + assessory.round(2)).round(2)
  end

  def previous_contract
    unless self.previous_contract_id.nil?
      Rent.find(self.previous_contract_id) 
    end
  end

  def sum_rent
    (self.basic_rent.round(2) + sum_assessory_charges.round(2)).round(2)
  end

  def square_meters
    rooms.inject(0) { |a,b| a + b.square_meters }
  end

  def identifier
    "#{self.start.year}-#{self.start.month}/#{self.rooms.first.house.first}/#{self.rooms.first.number}"
  end
end
