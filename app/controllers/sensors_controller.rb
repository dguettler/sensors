class SensorsController < ApplicationController
  respond_to :json

  def index
    respond_with Sensor.all
  end

end