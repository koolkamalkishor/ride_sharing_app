require "rails_helper"

RSpec.feature "Users can delete rides" do
  scenario "successfully" do
    FactoryGirl.create(:ride, destination: "Nairobi", checkout: Time.now, passengers: 4)

    visit "/"
    click_link "Nairobi"
    click_link "Delete Ride"

    expect(page).to have_content "Ride has been deleted."
    expect(page.current_url).to eq rides_url
    expect(page).to have_no_content "Nairobi"
  end
end