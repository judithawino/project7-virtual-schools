class Exam < ApplicationRecord
    belongs_to :course
    has_many :questions, dependent: :destroy
    has_many :answers, through: :questions
    
    validates :title, :start_time, :duration, :course_id, {
        presence: true
    }
    validates :title, {
        inclusion: {
            in: ['Exam', 'Quiz', 'Assessment']
        }
    }    
end
