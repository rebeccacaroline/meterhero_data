FactoryGirl.define do
  factory :meter do
    utility "Water"
    units_saved 0.0
    dollar_amount_saved 0.0
    city "San Francisco"
    state "CA"
  end

end
