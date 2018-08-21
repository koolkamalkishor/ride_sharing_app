require "rails_helper"

RSpec.feature "Users can delete rides" do
  before do
    login_as(FactoryGirl.create(:user, :admin))
  end
  scenario "successfully" do
    FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4)

    visit "/"
    click_link "Nairobi"
    click_link "Delete Ride"

    expect(page).to have_content "Ride has been deleted."
    expect(page.current_url).to eq rides_url
    expect(page).to have_no_content "Nairobi"
  end
end