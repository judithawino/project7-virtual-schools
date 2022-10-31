class Exam < ApplicationRecord
    belongs_to :course
    belongs_to :owner
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
     
    # def ask_question(duration)
    #     puts "\n=== NEW QUESTION ==="
    #     # puts question
    #     Timeout::timeout(duration) do
    #       user_action = gets.chomp
    #       return user_action === answer
    #     end
    #   rescue Timeout::Error
    #     puts "🚧 time is up! solution: #{answer}"
    #     return false
    # end   
end
