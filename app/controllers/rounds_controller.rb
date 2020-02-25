class RoundsController < ApplicationController
  def index
    @rounds = Round.all
  end

  def show
  end

  def new
    @round = Round.new
    @game_session = GameSession.find(params[:game_session_id].to_i)
  end

  def create
    @round = Round.new
    @round.game_mode = params[:round][:game_mode]
    @round.start_page = params[:round][:start_page]
    @round.end_page = params[:round][:end_page]
    @round.game_session_id = params[:game_session_id].to_i
    if @round.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  # def round_params
  #   params.require[:round].permit[:game_mode, :start_page, :end_page]
  # end
end
