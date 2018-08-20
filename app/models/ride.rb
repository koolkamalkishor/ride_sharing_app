class Ride < ApplicationRecord
  has_many :interests, dependent: :delete_all

  validates :destination, presence: true
  validates :checkout, presence: true
  validates :passengers, presence: true
end
