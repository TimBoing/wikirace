class Round < ApplicationRecord
  belongs_to :game_session
  has_many :round_participations
  validates :game_session, presence: true

end
