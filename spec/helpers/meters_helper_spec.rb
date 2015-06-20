require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MetersHelper. For example:
#
# describe MetersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MetersHelper, type: :helper do

  let!(:meters){Meter.all}

  describe "calculate_savings" do
    it "takes one argument" do
      expect(MetersHelper.instance_method(:calculate_savings).arity).to eq(1)
    end

    it "returns an array" do
      expect(calculate_savings(meters)).to be_an_instance_of(Array)
    end

    it "returns an array of non-nil values" do
      expect(calculate_savings(meters).sample).to_not be(nil)
    end

    it "returns an array of floats" do
      expect(calculate_savings(meters).sample).to be_an_instance_of(Float)
    end

    it "returns an array of length 4" do
      expect(calculate_savings(meters).length).to eq(4)
    end

  end
end
