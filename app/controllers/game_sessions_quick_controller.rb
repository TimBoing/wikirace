class GameSessionsQuickController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @game_session = GameSession.find(100)
    @round = Round.new
    @round.game_session = @game_session
    @round.save
    @round_participation = RoundParticipation.new
  end
end
