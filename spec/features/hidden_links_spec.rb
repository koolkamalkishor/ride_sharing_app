require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:ride) { FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4)}
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  # context "anonymous users" do
  #   scenario "cannot see the New Ride link" do
  #     visit "/"
  #     expect(page).not_to have_link "New Ride"
  #   end
  # end

  context "regular users" do
    before { login_as(user) }

    scenario "can see the New Ride link" do
      visit "/"
      expect(page).to have_link "New Ride"
    end

    scenario "cannot see the Delete Ride link" do
      visit ride_path(ride)
      expect(page).not_to have_link "Delete Ride"
    end
  end

  context "admin users" do
    before { login_as(admin) }

    scenario "can see the New Ride link" do
      visit "/"
      expect(page).to have_link "New Ride"
    end

    scenario "can see the Delete Ride link" do
      visit ride_path(ride)
      expect(page).to have_link "Delete Ride"
    end
  end
end