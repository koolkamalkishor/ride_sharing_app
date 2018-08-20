require "rails_helper"
RSpec.feature "Users can view interests" do

  before do
    ride = FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4)
    FactoryGirl.create(:interest, ride: ride,
                       name: "Interested")
    ride2 = FactoryGirl.create(:ride, destination: "Mombasa", checkout: "18:00", passengers: 2)
    FactoryGirl.create(:interest, ride: ride2,
                       name: "Not Interested")
    visit "/"
  end

  scenario "for a given ride" do
    click_link "Nairobi"
    expect(page).to have_content "Interested"
    expect(page).to_not have_content "Not Interested"
    click_link "Interested"
    within("#interest h2") do
      expect(page).to have_content "Interested"
    end
  end
end