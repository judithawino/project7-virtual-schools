class Student < ApplicationRecord
    belongs_to :school
    belongs_to :course
    has_many :discussions
    has_many :attendances
    has_many :lessons, through: :attendances
    # has_many :exam, through: :course
    has_secure_password
    
    validates :name, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 8..20 }
    validate :emailbait?

  EMAIL_PATTERNS = [
    /@student.school.com/i
    # /Secret/i,
    # /Top \d/i,
    # /gmailGuess/i
  ]

  def emailbait?
    if EMAIL_PATTERNS.none? { |pat| pat.match email }
      errors.add(:email, "write the correct email address")
    end
  end
end




