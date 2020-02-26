class RoundParticipationsController < ApplicationController
  def new
    @round_participation = RoundParticipation.new
    @round = Round.find(params[:round_id])
    @game_session = GameSession.find(@round.game_session_id)
  end

  def create
    @round_participation = current_user.round_participations.new(round_participations_params)
    if params[:round_id]
      @round = Round.find(params[:round_id])
      @round_participation.round = @round
    else
      @round = Round.find(round_participations_params[:round_id])
    end
    @round_participation.save
    @game_session = GameSession.find(@round.game_session_id)
    render 'game_sessions/show'
  end

  def edit
  end

  def update
  end

  private

  def round_participations_params
    if params[:round_participation] != nil
      params.require(:round_participation).permit(:round_id)
    end
  end
end
