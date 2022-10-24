class Educator < ApplicationRecord
    validates :name, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 8..20 }
    # belongs_to :school
    has_many :resources
end
