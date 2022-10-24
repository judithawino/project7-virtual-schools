class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_one :school  
end
