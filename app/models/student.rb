class Student < ApplicationRecord
     belongs_to :school
    # Student belongs_to :course
    # Student has_many :discussions
    # Student has_many :attendance
    # Student has_many :lessons, through: :attendance
    # Student has_many :exam, through: :course
    has_secure_password
    
    validates :name, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 8..20 }
end
