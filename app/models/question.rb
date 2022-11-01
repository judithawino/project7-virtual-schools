class Question < ApplicationRecord
    belongs_to :exam
    has_one :answer, dependent: :destroy
    validates :question, presence: true
end
