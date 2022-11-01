class Question < ApplicationRecord
    belongs_to :exam
    has_one :answer, dependent: :destro
    validates :question, presence: true
end
