class MetersController < ApplicationController
  def index
    @meters = Meter.where("city=?", params["city"])
    return 404 if @meters.length == 0
    savings = calculate_savings(@meters)
    render json: {meters: @meters, savings: {electric: savings[0], gas: savings[1], water: savings[2], total: savings[3]}}
  end

end
