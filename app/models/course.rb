class Course < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :exams, dependent: :destroy
    has_many :students, dependent: :destroy
    belongs_to :school
    belongs_to :owner   
end
