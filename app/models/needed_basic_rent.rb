class NeededBasicRent < ActiveRecord::Base
  def self.current_at(date)
    all = NeededBasicRent.all.order('start').reverse
    all.each do |a|
      return a.value if date >= a.start
    end
    return 0
  end
end
