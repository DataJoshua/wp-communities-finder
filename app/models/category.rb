class Category < ApplicationRecord
    has_many :communities, dependent: :destroy
end
