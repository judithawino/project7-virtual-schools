class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :duration
end
