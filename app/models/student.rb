class Student < ApplicationRecord
    belongs_to :school
    belongs_to :course
    # has_many :discussions
    # has_many :attendance
    # has_many :lessons, through: :attendance
    # has_many :exam, through: :course
    has_secure_password
    
    # validates :name, presence: true
    # validates :email, uniqueness: true
    # validates :password, length: { in: 8..20 }
end
