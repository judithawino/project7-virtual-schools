class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :school_id, :course_id
  has_many :discussions
end
