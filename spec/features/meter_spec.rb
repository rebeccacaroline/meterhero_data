require 'spec_helper'

describe 'Meter', js: true do

  let!(:meter) {FactoryGirl.create :meter}

  it "shows a notice when the city cannot be found" do
    visit root_path
    fill_in 'Type City Here', with: "feihqfuh"
    click_on("Submit")
    expect(page).to have_content("That city could not be found")
  end

  it "shows a list of meters when the city is found" do
    visit root_path
    fill_in 'Type City Here', with: "San Francisco"
    click_on("Submit")
    expect(page).to have_content("Water Units Saved")
  end
end