unless User.exists?(email: "admin@sharemyride.com")
  User.create!(email: "admin@sharemyride.com", password: "password", admin: true)
end

unless User.exists?(email: "viewer@sharemyride.com")
  User.create!(email: "viewer@sharemyride.com", password: "password")
end

["Nairobi", "Kisumu"].each do |destination|
  unless Ride.exists?(destination: destination)
             Ride.create!(destination: destination, passengers: 4, checkout: "13:00")
  end
end