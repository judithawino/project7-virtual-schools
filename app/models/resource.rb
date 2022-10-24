class Resource < ApplicationRecord
   belongs_to :educator
   # has_many :students


   validates :title, :url, presence:true
end

