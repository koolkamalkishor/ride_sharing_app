require 'rails_helper'

RSpec.feature " users can respond to ride offers" do
  let(:user) { FactoryGirl.create(:user)}
  before do
    login_as(user)
    ride = FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4)
    assign_role!(user, :editor, ride)

    visit ride_path(ride)
    click_link "New Interest"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Interested"
    click_button "Create Interest"

    expect(page).to have_content "Interest has been created."
    within("#interest") do
      expect(page).to have_content "Author: #{user.email}"
    end
  end

  scenario "when providing invalid attributes" do
    click_button "Create Interest"

    expect(page).to have_content "Interest has not been created."
    expect(page).to have_content "Name can't be blank"
  end
end