class Ride < ApplicationRecord
  validates :destination, presence: true
  validates :checkout, presence: true
  validates :passengers, presence: true
end
