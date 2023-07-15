class Community < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :user, presence: true
  validates :category, presence: true

  validates :description, length: { minimum: 100, maximum: 500 }

  SOCIALS = %i[WhatsApp Telegram].freeze

  enumerize :social, in: SOCIALS, scope: :shallow, predicates: true 
  validates :social, presence: true

  ransacker :created_at do
    Arel.sql('date(created_at)')
  end
end
