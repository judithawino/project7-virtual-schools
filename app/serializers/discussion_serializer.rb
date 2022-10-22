class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :chat_body, :student_id
end
