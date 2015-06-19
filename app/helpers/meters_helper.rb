module MetersHelper
  def calculate_savings(meters)
    electricity_savings = []
    water_savings = []
    gas_savings = []
    meters.each do |meter|
      case meter.utility
      when "electric"
        electricity_savings << meter.dollar_amount_saved
      when "gas"
        gas_savings << meter.dollar_amount_saved
      when "water"
        water_savings << meter.dollar_amount_saved
      end
    end
    electricity_savings = electricity_savings.reduce(:+).round(2)
    gas_savings = gas_savings.reduce(:+).round(2)
    water_savings = water_savings.reduce(:+).round(2)
    total_savings = electricity_savings + gas_savings + water_savings.round(2)
    return [electricity_savings, gas_savings, water_savings, total_savings]
  end
end
