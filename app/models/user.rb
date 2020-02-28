class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :game_sessions
  has_many :round_participations
  has_many :messages, dependent: :destroy
  has_many :paths, dependent: :destroy

  has_one_attached :photo

  def total_score_for(game_session)
    game_session.round_participations.where(user: self).map(&:score).sum
  end
end
