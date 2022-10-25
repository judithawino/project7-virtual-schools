class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :answer, :is_plagiarised
end
