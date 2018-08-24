require "rails_helper"

RSpec.feature "Admins can manage a user's roles" do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:user) { FactoryGirl.create(:user) }

  let!(:ie) {  FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4) }
  let!(:st3) {  FactoryGirl.create(:ride, destination: "Kisumu", checkout: "18:00", passengers: 4) }

  before do
    login_as(admin)
  end

  scenario "when assigning roles to an existing user" do
    visit admin_user_path(user)
    click_link "Edit User"

    select "Viewer", from: "Nairobi"
    select "Driver", from: "Kisumu"

    click_button "Update User"
    expect(page).to have_content "User has been updated"

    click_link user.email
    expect(page).to have_content "Nairobi: Viewer"
    expect(page).to have_content "Kisumu: Driver"
  end

  scenario "when assigning roles to a new user" do
    visit new_admin_user_path

    fill_in "Email", with: "newuser@ticketee.com"
    fill_in "Password", with: "password"

    select "Editor", from: "Nairobi"
    click_button "Create User"

    click_link "newuser@ticketee.com"
    expect(page).to have_content "Nairobi: Editor"
    expect(page).not_to have_content "Kisumu"
  end
end