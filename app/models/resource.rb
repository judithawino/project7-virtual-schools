class Resource < ApplicationRecord
   belongs_to :educator  
   # has_many :students
   validates :title, :attachment, presence:true

   # mount_uploader :attachment, AttachmentUploader
end

