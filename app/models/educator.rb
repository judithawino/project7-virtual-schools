class Educator < ApplicationRecord
    # validates :name, presence: true
    # validates :email, uniqueness: true
    # validates :password, length: { in: 8..20 }
    belongs_to :school
    has_many :students, through: :school
    has_many :resources, dependent: :destroy
    has_secure_password
    validate :emailbait?

  EMAIL_PATTERNS = [
    /@educator.com/i
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
