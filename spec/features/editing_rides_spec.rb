require 'rails_helper'

RSpec.feature "Users can edit existing rides" do
  before do
    FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4)

    visit "/"
    click_link "Nairobi"
    click_link "Edit Ride"
  end

  scenario "with valid attributes" do
    fill_in "Destination", with: "Mombasa"
    click_button "Update Ride"

    expect(page).to have_content "Ride has been updated"
    expect(page).to have_content "Mombasa"
  end

  scenario "when providing invalid attributes" do
    fill_in "Destination", with: ""
    click_button "Update Ride"

    expect(page).to have_content "Ride has not been updated."
  end
end