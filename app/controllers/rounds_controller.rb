require 'json'
require 'open-uri'

class RoundsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]

  def index
    @game_session = GameSession.find(params[:game_session_id])
    @rounds = Round.where(game_session_id: @game_session.id)
  end

  def show
    @round = Round.find(params[:id])
    @game_session = @round.game_session
    @round_participation_id = @round.round_participations.where(user: current_user).first.id

    ActionCable.server.broadcast("game_session_channel_#{@game_session.id}", content: @round.id) if @round.state != "playing"
    @round.update(state: "playing")

  end

  def new
    @round = Round.new
    @game_session = GameSession.find(params[:game_session_id])
    @wiki_pages = WikiPage.all
  end

  def create
    @round = Round.new(round_params)
    @round.game_session_id = params[:game_session_id]
    @round.game_mode = params[:round][:game_mode]
    @round.game_options = params[:round][:game_options]
    if params[:round][:start_page] == ""
      @round.start_page = random_page
    else
      @round.start_page = WikiPage.find(params[:round][:start_page]).title
    end
    if params[:round][:end_page] == ""
      @round.end_page = random_page
    else
      @round.end_page = WikiPage.find(params[:round][:end_page]).title
    end
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

  def update
    #/rounds/:id
    round = Round.find(params[:id])
    start_time = params[:start_time]
    round.update(start_time: start_time)
    ActionCable.server.broadcast("game_session_channel_#{@game_session.id}", end_game: "finished")
  end

  private

  def round_params
    params.require(:round).permit(:game_mode, :start_page, :end_page)
  end

  def random_page
    @round.page_random = true
    url_for_random_title = 'https://fr.wikipedia.org/api/rest_v1/page/random/title'
    page_raw = open(url_for_random_title).read
    page_json = JSON.parse(page_raw)
    page = page_json["items"][0]['title']
  end
end
