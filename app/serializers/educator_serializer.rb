class EducatorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :school_id, :password_digest
end
