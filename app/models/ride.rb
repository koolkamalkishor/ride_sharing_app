class Ride < ApplicationRecord
  has_many :interests, dependent: :delete_all
  has_many :roles, dependent: :delete_all

  validates :destination, presence: true
  validates :departure_time, presence: true
  validates :passengers,
            presence: true,
            numericality: {
                only_integer: true,
                greater_than: 0
            }


  def has_member?(user)
    roles.exists?(user_id: user)
  end

  [:driver, :editor, :viewer].each do |role|
    define_method "has_#{role}?" do |user|
      roles.exists?(user_id: user, role: role)
    end
  end

  scope :available_rides, (-> { where('departure_time >= ?', Time.current) })
end
