class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :percentage
  belongs_to :student, serializer: AttendancewithstudentsSerializer
  belongs_to :lesson, serializer: AttendancewithlessonsSerializer
end
