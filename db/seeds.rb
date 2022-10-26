
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding database...."

10.times do
    Owner.create(
        name: Faker::Name.name,
        email: Faker::Internet.free_email,
        password: Faker::Internet.password
    )
end

puts "Completed seeding data"

20.times do
    School.create(
        name: Faker::University.name,
        image_url: Faker::Avatar.image,
        owner_id: Owner.all[rand(Owner.count)].id
    )
end
puts "Successfully seeded database"

puts "Seeding data"
10.times do
    Educator.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      school_id: School.all[rand(School.count)].id
    )
  end
puts "Completed seeding data"

puts "Seeding data"
Course.create(title: "Python", duration: 62, image_url: "http://www.python.org/")
Course.create(title: "Ruby", duration: 67, image_url: "http://www.python.org/")
Course.create(title: "Nodejs", duration: 62, image_url: "http://www.python.org/")
Course.create(title: "Java", duration: 62, image_url: "http://www.python.org/")
Course.create(title: "Go", duration: 62, image_url: "http://www.python.org/")
Course.create(title: "Swift", duration: 62, image_url: "http://www.python.org/")
Course.create(title: "C++", duration: 62, image_url: "http://www.python.org/")
Course.create(title: "C", duration: 62, image_url: "http://www.python.org/")
puts "Completed Seeding data"

puts "Seeding data"
10.times do
    Student.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      school_id: School.all[rand(School.count)].id,
      course_id: Course.all[rand(Course.count)].id
    )
  end
puts "Completed seeding data"
  
puts "Seeding data"
Resource.create(title: "Introduction to python Enum", url: "https://www.python.org/", educator_id: 3)
Resource.create(title: "Introduction to python Enum", url: "https://www.python.org/", educator_id: 3)
Resource.create(title: "Introduction to python Enum", url: "https://www.python.org/", educator_id: 3)
Resource.create(title: "Introduction to python Enum", url: "https://www.python.org/", educator_id: 3)
puts "Completed data"

puts "Seeding the database....."

puts "Seeding data"
10.times do
    Lesson.create(
      topic: ["Data types", "Data Structures", "Variable types", "Scope", "Context Hooks"].shuffle.first,
      course_id: Course.all[rand(Course.count)].id
    )
  end
puts "Completed seeding data"

puts "Seeding data"
10.times do
    Attendance.create(
      percentage: [50, 60, 80, 40, 90, 70, 100].shuffle.first,
      lesson_id: Lesson.all[rand(Lesson.count)].id,
      student_id: Student.all[rand(Student.count)].id
    )
  end
puts "Completed seeding data"  
# end


puts "Done seeding the database!"

puts "Seeding data"

Exam.create(title: "Exam", exam_date: "3/4/2022", start_time: "8:30 a.m", duration: 60, course_id: 3)
Exam.create(title: "Quiz", exam_date: "3/4/2022", start_time: "10:30 a.m", duration: 45, course_id: 3)
Exam.create(title: "Assessment", exam_date: "3/4/2022", start_time: "12:30 a.m", duration: 60, course_id: 3)
# Exam.create(title: "Assessment", exam_date: "3/4/2022", start_time: "12:30 a.m", duration: 60, course_id: 3)
puts "completed Seeding data"

puts "Seeding data"

Question.create(question: "What is Ruby?", points: 1, exam_id:3)
Question.create(question: "Define context in React.", points: 1.5, exam_id:1)
Question.create(question: "Briefly explain the types of variables in Ruby", points: 6, exam_id:1)
Question.create(question: "What is DOM manipulation in javascript", points: 1.5, exam_id:2)
Question.create(question: "State and explain three advantages of CSS", points: 3, exam_id:3)

puts "Completed seeding data"

50.times do 
  Answer.create(
    answer: Faker::Lorem.paragraph,
    is_plagiarised: ["True", "False"].shuffle.first,
    question_id: Question.all[rand(Question.count)].id
  )
end


puts "Seeding data"
10.times do
    Discussion.create(
      chat_body: ["Data types", "Data Structures", "Variable types", "Scope", "Context Hooks"].shuffle.first,
      student_id: Student.all[rand(Student.count)].id
    )
  end
puts "Completed seeding data"



