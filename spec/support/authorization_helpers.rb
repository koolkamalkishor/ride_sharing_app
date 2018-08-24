module AuthorizationHelpers
  def assign_role!(user, role, ride)
    Role.where(user: user, ride: ride).delete_all
    Role.create!(user: user, role: role, ride: ride)
  end
end

RSpec.configure do |c|
  c.include AuthorizationHelpers
end