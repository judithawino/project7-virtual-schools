class Resource < ApplicationRecord
   has_many:educators
   has_many:students


   validates:resource,presence:true
end

