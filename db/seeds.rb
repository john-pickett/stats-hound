
#Create Users
5.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Number.number(8)
  )
end
users = User.all

# Create Applications
25.times do
  Application.create!(
  name: Faker::Name.unique.name,
  url: Faker::Address.city,
  user: users.sample
  )
end
applications = Application.all

# Create Events
100.times do
  Event.create!(
  name: Faker::LordOfTheRings.character,
  application: applications.sample
  )
end

# Update first user to me
user = User.first
user.update_attributes!(
  email: "john.pickett@gmail.com",
  password: "password"
)

puts "Seeding Finished"
puts "#{User.count} users created"
puts "#{Application.count} websites created"
puts "#{Event.count} events created"
