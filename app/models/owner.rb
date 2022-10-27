class Owner < ApplicationRecord
    has_one :school
    has_many :educators, through: :school
    has_many :students, through: :school
    has_secure_password

#     PASSWORD_FORMAT = /\A
#   (?=.{8,}) 
#   (?=.*\d) 
#   (?=.*[a-z])   
#   (?=.*[A-Z])
#   (?=.*[[:^alnum:]])
# /x

#   validates :name, presence: true, uniqueness: true, length: {minimum: 8}
#   validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
#   validates :password, 
#   presence: true, 
#   length: { minimum: 8}, 
#   format: { with: PASSWORD_FORMAT }, 
#   confirmation: true, 
#   on: :create 
validate :emailbait?

  EMAIL_PATTERNS = [
    /@admin.com/i
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
