puts "Seeding database...."

10.times do
    Owner.create(
        name: Faker::Name.name,
        email: Faker::Internet.free_email,
        password: Faker::Internet.password
    )
end

20.times do
    School.create(
        name: Faker::University.name,
        image_url: Faker::Avatar.image,
        owner_id: Owner.all[rand(Owner.count)].id
    )
end
puts "Successfully seeded database"