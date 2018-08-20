require 'rails_helper'

RSpec.feature "Users can view rides" do
  scenario "with the ride details" do
    ride = FactoryGirl.create(:ride, destination: "Nairobi", checkout: Time.now, passengers: 4)

    visit "/"
    click_link "Nairobi"
    expect(page.current_url).to eq ride_url(ride)
  end
end