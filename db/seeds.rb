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
