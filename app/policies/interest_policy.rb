class InterestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    user.try(:admin?) || record.ride.has_member?(user)
  end

  def create?
    user.try(:admin?) || record.ride.has_driver?(user) ||
        record.ride.has_editor?(user)
  end
end
