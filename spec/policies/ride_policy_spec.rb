require 'rails_helper'

describe RidePolicy do

  let(:user) { User.new }

  subject { RidePolicy }

  context "policy_scope" do
    subject { Pundit.policy_scope(user, Ride) }

    let!(:ride) { FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4) }
    let(:user) { FactoryGirl.create :user }

    it "is empty for anonymous users" do
      expect(Pundit.policy_scope(nil, Ride)).to be_empty
    end

    it "includes rides a user is allowed to view" do
      assign_role!(user, :viewer, ride)
      expect(subject).to include(ride)
    end

    it "doesn't include ride a user is not allowed to view" do
      expect(subject).to be_empty
    end

    it "returns all ride for admins" do
      user.admin = true
      expect(subject).to include(ride)
    end
  end

  permissions :update? do
    let(:user) { FactoryGirl.create :user }
    let(:ride) { FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4) }

    it "blocks anonymous users" do
      expect(subject).not_to permit(nil, ride)
    end

    it "doesn't allow viewers of the project" do
      assign_role!(user, :viewer, ride)
      expect(subject).not_to permit(user, ride)
    end

  it "doesn't allows editors of the project" do
    assign_role!(user, :editor, ride)
    expect(subject).not_to permit(user, ride)
  end

  it "allows managers of the project" do
    assign_role!(user, :driver, ride)
    expect(subject).to permit(user, ride)
  end

  it "allows administrators" do
    admin = FactoryGirl.create :user, :admin
    expect(subject).to permit(admin, ride)
  end

  it "doesn't allow users assigned to other projects" do
    other_ride = FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4)
    assign_role!(user, :driver, other_ride)
    expect(subject).not_to permit(user, ride)
  end
end

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
