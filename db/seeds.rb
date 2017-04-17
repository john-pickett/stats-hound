#Create Users

5.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Number.number(8)
  )
end
users = User.all

25.times do
  Application.create!(
  name: Faker::Name.unique.name,
  url: Faker::Address.city,
  user: users.sample
  )
end
applications = Application.all


user = User.first
user.update_attributes!(
  email: "john.pickett@gmail.com",
  password: "password"
)

puts "Seeding Finished"
puts "#{User.count} users created"
puts "#{Application.count} websites created"
