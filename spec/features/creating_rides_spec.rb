require 'rails_helper'

RSpec.feature "Users can create new rides" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New Ride"

    fill_in "Destination", with: "Nairobi"
    fill_in "Checkout", with: Time.now
    fill_in "Passengers", with: 4
    click_button "Create Ride"

    expect(page).to have_content "Ride has been created."
  end
end