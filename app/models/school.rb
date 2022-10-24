class School < ApplicationRecord
    belongs_to :owner
    has_many :educators

    validates :name, :owner_id, :image_url, presence: true
end
