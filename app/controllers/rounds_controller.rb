require 'json'
require 'open-uri'

class RoundsController < ApplicationController
  def index
    @game_session = GameSession.find(params[:game_session_id])
    @rounds = Round.where(game_session_id: @game_session.id)
  end

  def show
    @round = Round.find(params[:id])
    @game_session = @round.game_session
    @round_participation_id = @round.round_participations.where(user: current_user).first.id
     if current_user == @game_session.user
      @round.update(state: "playing")
     end
  end

  def new
    @round = Round.new
    @game_session = GameSession.find(params[:game_session_id])
  end

  def create
    @round = Round.new(round_params)
    @round.game_session_id = params[:game_session_id]

    # Creation of the random start page and end page through API----
    url_for_random_title = 'https://fr.wikipedia.org/api/rest_v1/page/random/title'
    start_page_raw = open(url_for_random_title).read
    start_page_json = JSON.parse(start_page_raw)
    start_page = start_page_json["items"][0]['title']
    end_page_raw = open(url_for_random_title).read
    end_page_json = JSON.parse(end_page_raw)
    end_page = end_page_json["items"][0]['title']

    @round.start_page = start_page
    @round.end_page = end_page
    # End of creation-----------------------------------------------

    if @round.save
      round_participation = RoundParticipation.new
      round_participation.user_id = current_user.id
      round_participation.round_id = @round.id
      if round_participation.save
        redirect_to game_session_path(params[:game_session_id])
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
