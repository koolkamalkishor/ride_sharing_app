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

  context "permissions" do
    subject { RidePolicy.new(user, ride) }

    let(:user) { FactoryGirl.create(:user) }
    let(:ride) { FactoryGirl.create(:ride, destination: "Nairobi", checkout: "18:00", passengers: 4) }

    context "for anonymous users" do
      let(:user) { nil }
      it { should_not permit_action :show }
      it { should_not permit_action :update }
    end

    context "for viewers of the ride" do
      before { assign_role!(user, :viewer, ride) }
      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context "for editors of the ride" do
      before { assign_role!(user, :editor, ride) }
      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context "for drivers of the ride" do
      before { assign_role!(user, :driver, ride) }
      it { should permit_action :show }
      it { should permit_action :update }
    end

    context "for drivers of other rides" do
      before do
        assign_role!(user, :driver, FactoryGirl.create(:ride, destination: "Kisumu", checkout: "18:00", passengers: 4))
      end
      it { should_not permit_action :show }
      it { should_not permit_action :update }
    end
    context "for administrators" do
      let(:user) { FactoryGirl.create :user, :admin }
      it { should permit_action :show }
      it { should permit_action :update }
    end
  end
end
