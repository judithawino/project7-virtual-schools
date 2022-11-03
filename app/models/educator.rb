class Educator < ApplicationRecord
  belongs_to :owner
  belongs_to :school 
  has_many :lessons
  has_many :students, through: :school
  has_many :resources, dependent: :destroy
  validates :name, presence: true
  validates :email, uniqueness: true
  # validates :phone_contact, presence: true, uniqueness: true, length: {is: 13}
  validates :password, length: { minimum: 8}

  has_secure_password

  validate :emailbait?
  # validate :contactbait?
  EMAIL_PATTERNS = [
    /@educator.com/i   
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
