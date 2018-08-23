require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:ride) { FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4)}
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  context "non admin users" do
    before do
      login_as(user)
      assign_role!(user, :viewer, ride)
    end
    scenario "can see the New Ride link" do
      visit "/"
      expect(page).to have_link "New Ride"
    end

    scenario "cannot see the New Interest link" do
      visit ride_path(ride)
      expect(page).not_to have_link "New Interest"
    end

    scenario "cannot see the Edit Ride link" do
      visit ride_path(ride)
      expect(page).not_to have_link "Edit Ride"
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

    scenario "can see the New Interest link" do
      visit ride_path(ride)
      expect(page).to have_link "New Interest"
    end

    scenario "can see the Edit Ride link" do
      visit ride_path(ride)
      expect(page).to have_link "Edit Ride"
    end

    scenario "can see the Delete Ride link" do
      visit ride_path(ride)
      expect(page).to have_link "Delete Ride"
    end
  end
end