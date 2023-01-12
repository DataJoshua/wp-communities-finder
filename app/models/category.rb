class Category < ApplicationRecord
  has_many :communities, dependent: :destroy

  validates :name, presence: true
end
