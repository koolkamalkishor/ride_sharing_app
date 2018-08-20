class Ride < ApplicationRecord
  has_many :interests

  validates :destination, presence: true
  validates :checkout, presence: true
  validates :passengers, presence: true
end
