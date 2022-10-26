class School < ApplicationRecord
    belongs_to :owner
    has_many :educators, dependent: :destroy
    has_many :students, dependent: :destroy
    has_many :courses, through: :students
    has_many :resources, through: :educators

    # validates :name, :owner_id, :image_url, presence: true
end
