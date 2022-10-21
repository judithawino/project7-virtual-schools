
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


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding data"

Exam.create(title: "Exam", exam_date: "3/4/2022", start_time: "8:30 a.m", duration: 60, course_id: 3)
Exam.create(title: "Quiz", exam_date: "3/4/2022", start_time: "10:30 a.m", duration: 45, course_id: 3)
# Exam.create(title: "Assessment", exam_date: "3/4/2022", start_time: "12:30 a.m", duration: 60, course_id: 3)
# Exam.create(title: "Assessment", exam_date: "3/4/2022", start_time: "12:30 a.m", duration: 60, course_id: 3)
puts "completed Seeding data"

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


