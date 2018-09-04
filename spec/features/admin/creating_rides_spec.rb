require 'rails_helper'

RSpec.feature "Users can create new rides" do
  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit "/"

    click_link "New Ride"
  end
  scenario "with valid attributes" do
    fill_in "Destination", with: "Nairobi"
    fill_in "Departure Time", with: Time.now
    fill_in "Passengers", with: 4
    click_button "Create Ride"

    expect(page).to have_content "Ride has been created."
  end

  scenario "when providing invalid attributes" do
    click_button "Create Ride"

    expect(page).to have_content "Ride has not been created"
    expect(page).to have_content "Destination can't be blank"
  end
end