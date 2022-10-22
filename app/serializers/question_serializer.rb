class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :points, :exam_id
end
