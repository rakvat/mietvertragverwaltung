class Rent < ActiveRecord::Base
  belongs_to :room
  belongs_to :tenant

  def sum_assessory_charges
    #todo
    0
  end

  def assessory_charges
    #todo
    0
  end

  def heating_charges
    #todo
    0
  end

  def sum_rent
    #todo
    0
  end
end
