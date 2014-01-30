module RentsHelper
  def price f
    "#{sprintf("%.2f",f.round(2))}€"
  end
  def deci f
    sprintf("%.2f",f.round(2))
  end
  def date d
    d.strftime("%d.%m.%Y")
  end
end
