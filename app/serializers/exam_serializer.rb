class ExamSerializer < ActiveModel::Serializer
  attributes :id, :title, :exam_date, :start_time, :duration, :course_id
end
