class Exam < ApplicationRecord
    belongs_to :course
    
    validates :title, :start_time, :duration, :course_id, {
        presence: true
    }
    validates :title, {
        inclusion: {
            in: ['Exam', 'Quiz', 'Assessment']
        }
    }    
end
