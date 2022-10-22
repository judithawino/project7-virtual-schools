class EducatorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :school_id
end
