class School < ApplicationRecord
    belongs_to :owner
    has_many :educators
    has_many :students
    has_many :courses, through: :students
    has_many :resources, through: :educators

    validates :name, :owner_id, :image_url, presence: true
end
