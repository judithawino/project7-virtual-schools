class Course < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :exams, dependent: :destroy
    has_many :students, dependent: :destroy
    has_many :schools, dependent: :destroy    
end
