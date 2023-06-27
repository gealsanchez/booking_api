class Automobile < ApplicationRecord
  has_many :users, through: :tickets
  has_many :tickets, dependent: :destroy

  validates :model, presence: true
  validates :year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }
  validates :rate, presence: true, numericality: { greater_than: 0 }
  validates :location, presence: true
end
