class Community < ApplicationRecord
    belongs_to :user
    belongs_to :category
end