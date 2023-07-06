class User < ApplicationRecord
  has_many :tickets, foreign_key: :customer_id, dependent: :destroy
  has_many :automobiles, through: :tickets

  validates :name, presence: true, uniqueness: true
end
