class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :percentage, :lesson_id, :student_id
end
