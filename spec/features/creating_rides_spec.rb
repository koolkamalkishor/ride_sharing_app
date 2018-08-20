require 'rails_helper'

RSpec.feature "Users can create new rides" do
  before do
    visit "/"

    click_link "New Ride"
  end
  scenario "with valid attributes" do
    fill_in "Destination", with: "Nairobi"
    fill_in "Checkout", with: "18:00"
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