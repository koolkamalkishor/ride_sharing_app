require "rails_helper"
RSpec.feature "Users can edit existing interests" do
  let(:ride) { FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4) }
  let(:interest) { FactoryGirl.create(:interest, ride: ride) }
  before do
    visit ride_interest_path(ride, interest)
    click_link "Edit Interest"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Not Interested"
    click_button "Update Interest"
    expect(page).to have_content "Interest has been updated."
    within("#interest h2") do
      expect(page).to have_content "Not Interested"
      expect(page).not_to have_content interest.name
    end
  end
  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Interest"
    expect(page).to have_content "Interest has not been updated."
  end
end