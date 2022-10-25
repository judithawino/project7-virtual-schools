class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url
  has_many :courses, through: :students
  has_many :resources, through: :educators
end
