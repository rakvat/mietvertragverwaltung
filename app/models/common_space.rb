class CommonSpace < ActiveRecord::Base
  def self.current_at(date)
    all = CommonSpace.all.order('start').reverse
    all.each do |a|
      return a.value if date >= a.start
    end
    return 0
  end
end
