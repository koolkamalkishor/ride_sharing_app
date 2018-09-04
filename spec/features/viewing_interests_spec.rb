require "rails_helper"
RSpec.feature "Users can view interests" do

  before do
    author = FactoryGirl.create(:user)

    ride = FactoryGirl.create(:ride, destination: "Nairobi", departure_time: Time.now, passengers: 4)
    assign_role!(author, :viewer, ride)
    FactoryGirl.create(:interest, ride: ride,
                       author: author, name: "Interested")
    ride2 = FactoryGirl.create(:ride, destination: "Mombasa", departure_time: Time.now, passengers: 2)
    assign_role!(author, :viewer, ride2)
    FactoryGirl.create(:interest, ride: ride2,
                       author: author, name: "Not Interested")

    login_as(author)
    visit "/"
  end
end