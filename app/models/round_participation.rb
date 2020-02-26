class RoundParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :visited_pages
  validates :user, presence: true
  validates :round, presence: true

end
