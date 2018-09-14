require 'rails_helper'

RSpec.feature " users can respond to ride offers" do
  let(:user) { FactoryGirl.create(:user)}
  before do
    login_as(user)
    ride = FactoryGirl.create(:ride, destination: "Nairobi", departure_time: Time.now, passengers: 4)
    assign_role!(user, :editor, ride)

    visit ride_path(ride)
    click_link "Interested ?"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Interested"
    click_button "Create Interest"
    
  end

  scenario "when providing invalid attributes" do
    click_button "Create Interest"

  end
end