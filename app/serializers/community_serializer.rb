class CommunitySerializer < ApplicationSerializer
  attributes :id, :name, :description, :url

  belongs_to :category
  belongs_to :user
end
