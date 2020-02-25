class RoundParticipationsController < ApplicationController
  def new
    @round_participation = RoundParticipation.new
  end

  def create
    @round_participation = RoundParticipation.new(params[:user])
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
