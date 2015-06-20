require 'rails_helper'

RSpec.describe Meter, type: :model do

  it {should have_db_column(:utility)}

  it {should have_db_column(:units_saved)}

  it {should have_db_column(:dollar_amount_saved)}

  it {should have_db_column(:city)}

  it {should have_db_column(:state)}

end
