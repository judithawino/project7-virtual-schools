class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :chat_body, :student_id
  belongs_to :student, serializer: DiscussionWithStudentsSerializer
end
