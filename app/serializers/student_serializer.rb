class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :school_id, :course_id 
end
