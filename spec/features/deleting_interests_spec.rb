require "rails_helper"
RSpec.feature "Users can delete interests" do
  let(:ride) { FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4) }
  let(:interest) { FactoryGirl.create(:interest, ride: ride) }

  before do
    visit ride_interest_path(ride, interest)
  end
  scenario "successfully" do
    click_link "Delete Interest"
    expect(page).to have_content "Interest has been deleted."
    expect(page.current_url).to eq ride_url(ride)
  end
end