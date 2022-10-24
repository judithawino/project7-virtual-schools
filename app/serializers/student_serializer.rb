class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :school_id, course_id
end
