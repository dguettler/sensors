class Sensor < ActiveRecord::Base
  self.inheritance_column = nil

  has_many :readings
end