class UserSerializer < ApplicationSerializer 
  attributes :email, :first_name, :nickname

  has_many :communities
end
