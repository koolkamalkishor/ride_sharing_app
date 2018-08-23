require 'rails_helper'

describe RidePolicy do

  let(:user) { User.new }

  subject { RidePolicy }

  permissions :show? do
    let(:user) { FactoryGirl.create :user }
    let(:ride) {  FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4) }

    it "blocks anonymous users" do
      expect(subject).not_to permit(nil, ride)
    end

    it "allows viewers of the ride" do
      assign_role!(user, :viewer, ride)
      expect(subject).to permit(user, ride)
    end

    it "allows drivers of the ride" do
      assign_role!(user, :driver, ride)
      expect(subject).to permit(user, ride)
    end

    it "allows administrators" do
      admin = FactoryGirl.create :user, :admin
      expect(subject).to permit(admin, ride)
    end
    it "doesn't allow users assigned to other ride" do
      other_ride =  FactoryGirl.create(:ride, destination: "Eldoret", checkout: "18:00", passengers: 4)
      assign_role!(user, :driver, other_ride)
      expect(subject).not_to permit(user, ride)
    end
  end

end
