class MetersController < ApplicationController
  def index
    @meters = Meter.where("city=?", params["city"])
    p @meters
  end


end
