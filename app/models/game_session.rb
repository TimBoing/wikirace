class GameSession < ApplicationRecord
  belongs_to :user
  has_many :rounds
  has_many :messages, dependent: :destroy
  validates :user, presence: true
end
