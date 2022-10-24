class Question < ApplicationRecord
    belongs_to :exam
    has_one :answer
    validates :question, presence: true
end
