class User < ApplicationRecord
    
    has_many :communities, dependent: :destroy

    has_secure_password
end
