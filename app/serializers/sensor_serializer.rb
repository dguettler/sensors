class SensorSerializer < ApplicationSerializer
  attributes :id, :type
  has_many :readings
end