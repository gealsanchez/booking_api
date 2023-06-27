class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :automobile

  validates :date, presence: true
end
