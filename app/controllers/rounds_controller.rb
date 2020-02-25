class RoundsController < ApplicationController
  def index
    @game_session = GameSession.find(params[:game_session_id])
    @rounds = Round.where(game_session_id: @game_session.id)
  end

  def show
    @round = Round.find(params[:id].to_i)
    @game_session = @round.game_session
  end

  def new
    @round = Round.new
    @game_session = GameSession.find(params[:game_session_id].to_i)
  end

  def create
    @round = Round.new(round_params)
    @round.game_session_id = params[:game_session_id].to_i
    if @round.save
      round_participation = RoundParticipation.new
      round_participation.user_id = current_user.id
      round_participation.round_id = @round.id
      if round_participation.save
        redirect_to game_session_path(params[:game_session_id].to_i)
      else
        render :new
      end
    else
      render :new
    end
  end

  private

  def round_params
    params.require(:round).permit(:game_mode, :start_page, :end_page)
  end
end
