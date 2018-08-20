class Interest < ApplicationRecord
  belongs_to :ride
  belongs_to :author, class_name: "User"

  validates :name, presence: true
end
