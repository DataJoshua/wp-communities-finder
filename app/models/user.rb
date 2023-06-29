class User < ApplicationRecord
  extend Enumerize

  has_many :communities, dependent: :destroy

  EMAIL_REG = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :nickname, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, format:{ with: EMAIL_REG }

  ROLES = %i[user admin moderator].freeze

  enumerize :role, in: ROLES, scope: :shallow, predicates: true

  has_secure_password
end
