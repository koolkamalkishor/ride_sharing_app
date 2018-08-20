require 'rails_helper'

RSpec.feature " users can respond to ride offers" do
  before do
    ride = FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4)

    visit ride_path(ride)
    click_link "New Interest"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Interested"
    click_button "Create Interest"

    expect(page).to have_content "Interest has been created."
  end

  scenario "when providing invalid attributes" do
    click_button "Create Interest"

    expect(page).to have_content "Interest has not been created."
    expect(page).to have_content "Name can't be blank"
  end
end