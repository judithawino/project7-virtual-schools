class Course < ApplicationRecord
    has_many :lessons
    has_many :exams
    has_many :students
    has_many :schools, through: :students
    
end
