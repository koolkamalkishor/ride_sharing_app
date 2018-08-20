require 'rails_helper'

RSpec.describe RidesController, type: :controller do
  it "handles a missing ride correctly" do
    # # get :show, id: "not-here"
    #
    # expect(response).to redirect_to(rides_path)
    #
    # message = "The Ride you are looking for could not be found."
    # expect(flash[:alert]).to eq message
  end

end
