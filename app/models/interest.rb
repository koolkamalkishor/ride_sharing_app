class Interest < ApplicationRecord
  belongs_to :ride
  validates :name, presence: true
end
