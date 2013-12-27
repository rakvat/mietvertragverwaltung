class Tenant < ActiveRecord::Base
  has_many :rents
end
