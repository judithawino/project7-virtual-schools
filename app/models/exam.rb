class Exam < ApplicationRecord
    
    validates :title, :start_time, :duration, :course_id, {
        presence: true
    }
    validates :title, {
        inclusion: {
            in: %w(Exam, Quiz, Assessment)
        }
    }    
end
