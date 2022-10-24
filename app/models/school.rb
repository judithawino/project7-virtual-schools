class School < ApplicationRecord
    belongs_to :owner

    validates :name, :owner_id, :image_url, presence: true
end
