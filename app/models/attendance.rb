class Attendance < ApplicationRecord
    belongs_to :student
    belongs_to :lesson
    belongs_to :educator
end
