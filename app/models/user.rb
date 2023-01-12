class User < ApplicationRecord
  has_many :communities, dependent: :destroy

  validates :nickname, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
