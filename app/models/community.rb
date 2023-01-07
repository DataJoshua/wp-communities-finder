class Community < ApplicationRecord
    belongs_to :user
    belongs_to :category

    validates :name, presence: true
    validates :description, presence: true
    validates :url, presence: true
    validates :user, presence: true
    validates :category, presence: true

end