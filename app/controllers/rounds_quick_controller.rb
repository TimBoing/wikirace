require 'json'
require 'open-uri'

class RoundsQuickController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def new
    @round = Round.new
    @game_session = GameSession.find(params[:game_session_id])
    @wiki_pages = WikiPage.all.sort_by { |wiki_page| wiki_page.title }
  end

  def show
    @round = Round.find(params[:id])
    @round.game_mode = params[:game_mode]
    @round.game_options = params[:round][:game_options]
    @round.search_bar = params[:round][:search_bar]
    @round.reverse = params[:round][:reverse]
    @round.back = params[:round][:back]

    if params[:round][:start_page] == ""
      @round.start_page_url = random_page_url
      @round.start_page = random_page_title(@round.start_page_url)
      @round.start_page_random = true
    else
      @round.start_page = WikiPage.find(params[:round][:start_page]).title
      @round.start_page_url = WikiPage.find(params[:round][:start_page]).url
    end

    if params[:round][:end_page] == ""
      @round.end_page_url = random_page_url
      @round.end_page = random_page_title(@round.end_page_url)
      @round.end_page_random = true
    else
      @round.end_page = WikiPage.find(params[:round][:end_page]).title
      @round.end_page_url = WikiPage.find(params[:round][:end_page]).url
    end

    t = Time.now
    start_time = t.to_f * 1000
    @round.update(start_time: start_time)

    if @round.save
      round_participation = RoundParticipation.new
      round_participation.user_id = 23
      round_participation.round_id = @round.id
      if round_participation.save
        @host_name = request.protocol + request.host_with_port #pour gérer le soucis de redirection des bouttons
        @round = Round.find(params[:id])
        @game_session = @round.game_session
        @round_participation_id = @round.round_participations.where(user: 23).first.id
        @round.update(state: "playing")
      else
        render "game_sessions_quick/new"
      end
    else
      render "game_sessions_quick/new"
    end
  end

  def index
    # raise
    unknown_user = User.find(23)
    @round_participation = RoundParticipation.where(user: unknown_user)[0]
    if @round_participation.is_the_best?
      @round_participation.save_record(unknown_user)
    end
  end

  def update
    round = Round.find(params[:id])
    round.update(state: 'ended')
    winner = User.find(params[:winner]).username
    ActionCable.server.broadcast("game_session_channel_#{round.game_session.id}", end_game: winner)
    RoundScoreComputer.new(round).call
  end

  private

  def round_params
    params.require(:round).permit(:game_mode, :start_page, :end_page)
  end

  def random_page_url
    url_for_random_title = 'https://fr.wikipedia.org/api/rest_v1/page/random/title'

  end

  def random_page_title(url)
    page_raw = open(url).read
    page_json = JSON.parse(page_raw)
    page = page_json["items"][0]['title']
  end
end
