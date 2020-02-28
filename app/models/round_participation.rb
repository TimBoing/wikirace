class RoundParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :visited_pages
  validates :user, presence: true
  validates :round, presence: true
  validates :user, uniqueness: { scope: :round, message: "There can only be a RP per user per round" }
end
