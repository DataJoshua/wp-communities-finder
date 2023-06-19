class Community < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :user, presence: true
  validates :category, presence: true

  validates :description, length: { minimum: 10, maximum: 500 }
end
