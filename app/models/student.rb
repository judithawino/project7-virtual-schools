class Student < ApplicationRecord
    has_many :courses
    belongs_to :school

    validates :name, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 6..20 }
end
