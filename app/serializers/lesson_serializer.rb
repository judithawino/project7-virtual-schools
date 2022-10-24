class LessonSerializer < ActiveModel::Serializer
  attributes :id, :topic, :course_id
end
