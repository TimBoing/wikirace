class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :game_sessions
  has_many :round_participations
  has_many :messages, dependent: :destroy

  has_one_attached :photo

end
