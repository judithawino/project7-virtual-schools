class Owner < ApplicationRecord
    has_one :school
    has_many :educators, dependent: :destroy
    has_many :students, dependent: :destroy
    has_many :courses, dependent: :destroy
    has_many :exams, dependent: :destroy
    has_secure_password

    PASSWORD_FORMAT = /\A
  (?=.{8,}) 
  (?=.*\d) 
  (?=.*[a-z])   
  (?=.*[A-Z])
  (?=.*[[:^alnum:]])
/x

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  # validates :phone_contact, presence: true, uniqueness: true, length:{is: 13}
  validates :password, 
  presence: true, 
  length: { minimum: 8}, 
  format: { with: PASSWORD_FORMAT }, 
  confirmation: true, 
  on: :create 
  validate :emailbait?
   EMAIL_PATTERNS = [
    /@admin.com/i
    # /Secret/i,
    # /Top \d/i,
    # /gmailGuess/i
  ]

  def emailbait?
    if EMAIL_PATTERNS.none? { |pat| pat.match email }
      errors.add(:email, "Invalid")
    end
  end

  # CONTACT_PATTERNS = [    
  #   # (?:\+?|\b)[0-9]{13}\b 
  #   /+254/i,
  #   /[0-9]/i   
  # ] 

  # def contactbait?
  #   if CONTACT_PATTERNS.none? { |pat| pat.match phone_contact }
  #     errors.add(:phone_contact, "Enter a valid phone number")
  #   end
  # end

end
