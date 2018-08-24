class Role < ApplicationRecord
  belongs_to :user
  belongs_to :ride

  def self.available_roles
    %w(driver editor viewer)
  end
end
