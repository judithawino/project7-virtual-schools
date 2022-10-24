class School < ApplicationRecord
    belongs_to :owner
    has_many :educators
    has_many :students

    validates :name, :owner_id, :image_url, presence: true
end
