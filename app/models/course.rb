class Course < ApplicationRecord
    has_many :lessons
    has_many :exams
    belongs_to :school
end
