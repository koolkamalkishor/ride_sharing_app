require 'rails_helper'

RSpec.feature "Users can view rides" do
  let(:user) { FactoryGirl.create(:user) }
  let(:ride) { FactoryGirl.create(:ride, destination: "Nairobi", departure_time: Time.now, passengers: 4)}

  before do
    login_as(user)
    assign_role!(user, :viewer, ride)
  end
end