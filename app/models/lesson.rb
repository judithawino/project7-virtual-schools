class Lesson < ApplicationRecord
    belongs_to :course
    belongs_to :educator
    has_many :attendances
    has_many :students, through: :attendances
end
