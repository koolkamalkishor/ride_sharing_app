require 'rails_helper'

RSpec.feature "Users can view rides" do
  let(:user) { FactoryGirl.create(:user) }
  let(:ride) { FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4)}

  before do
    login_as(user)
    assign_role!(user, :viewer, ride)
  end
  scenario "with the ride details" do
    visit "/"
    click_link "Nairobi"
    expect(page.current_url).to eq ride_url(ride)
  end
end