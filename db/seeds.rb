require 'event_data'

#Create Users
3.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Number.number(8)
  )
end
users = User.all

# Create Applications
25.times do
  Application.create!(
  name: Faker::Internet.domain_name,
  url: Faker::Internet.url,
  user: users.sample
  )
end
applications = Application.all

# Create Events
10000.times do
  Event.create!(
  name: EventData.event_name,
  application: applications.sample,
  created_at: Faker::Time.backward(90, :morning)
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
