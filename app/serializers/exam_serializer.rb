class ExamSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_time, :duration, :course_id
end
