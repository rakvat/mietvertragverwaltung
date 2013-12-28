class NeededAssessoryCharge < ActiveRecord::Base
  def self.current_at(date)
    all = NeededAssessoryCharge.all.order('start').reverse
    all.each do |a|
      return a.value if date >= a.start
    end
    return 0
  end
end
