class Question < ApplicationRecord
    belongs_to :exam
    validates :question, presence: true
end
