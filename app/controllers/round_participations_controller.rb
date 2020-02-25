class RoundParticipationsController < ApplicationController
  def new
    @round_participation = RoundParticipation.new
    @round = Round.find(params[:round_id])
    @game_session = GameSession.find(@round.game_session_id)
  end

  def create
    @round_participation = RoundParticipation.new(params[:user])
    @round = Round.find(params[:round_id])
    @game_session = GameSession.find(@round.game_session_id)
    render 'game_sessions/show'
  end

  def edit
  end

  def update
  end

  private

  def round_participations_params
    params.require(:round_participations).permit(:user_id)
  end
end
