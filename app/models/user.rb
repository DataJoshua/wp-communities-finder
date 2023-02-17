class User < ApplicationRecord
  has_many :communities, dependent: :destroy

  EMAIL_REG = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :nickname, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true, format:{ with: EMAIL_REG }

  has_secure_password
end
