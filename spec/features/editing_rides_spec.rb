require 'rails_helper'

RSpec.feature "Users can edit existing rides" do
  let(:user) { FactoryGirl.create(:user) }
  let(:ride) { FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4)}

  before do
    login_as(user)
    assign_role!(user, :viewer, ride)

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