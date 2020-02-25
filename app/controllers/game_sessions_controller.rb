class GameSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @game_session = GameSession.new
  end

  def create
    @game_session = GameSession.new(user_id: current_user.id)
    if @game_session.save
      redirect_to new_game_session_round_path(@game_session)
    else
      render :new
    end
  end

  def show
    @game_session = GameSession.find(params[:id])
    @round = Round.where(game_session_id: @game_session).last
  end
end
