require 'faker'
puts "Seeding the database....."
10.times do
    Educator.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      school_id: Faker::IDNumber.valid
    )
  end

puts "Done seeding the database!"
