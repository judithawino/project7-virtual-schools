class Owner < ApplicationRecord
    has_one :school
    has_secure_password

    PASSWORD_FORMAT = /\A
  (?=.{8,}) 
  (?=.*\d) 
  (?=.*[a-z])   
  (?=.*[A-Z])
  (?=.*[[:^alnum:]])
/x

  validates :name, presence: true, uniqueness: true, length: {minimum: 8}
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :password, 
  presence: true, 
  length: { minimum: 8}, 
  format: { with: PASSWORD_FORMAT }, 
  confirmation: true, 
  on: :create 

end
