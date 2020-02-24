class GameSession < ApplicationRecord
  belongs_to :user
  has_many :rounds
  validates :user, presence: true
end
