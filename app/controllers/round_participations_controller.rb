class RoundParticipationsController < ApplicationController
  before_action :find_round

  def new
    @round_participation = RoundParticipation.new
    @game_session = GameSession.find(@round.game_session_id)
    @creator = User.find(@game_session.user_id)
  end

  def create
    @round_participation = current_user.round_participations.new(round_id: @round.id)
    @round_participation.save
    @game_session = GameSession.find(@round.game_session_id)
    redirect_to game_session_path(@game_session)
  end

  def edit
  end

  def update
  end

  private

  def find_round
    @round = Round.find(params[:round_id])
  end
end

