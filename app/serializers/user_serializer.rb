class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name,:last_name, :email, :authentication_token, :date_of_birth
  
end
