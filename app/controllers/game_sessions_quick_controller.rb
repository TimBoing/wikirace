class GameSessionsQuickController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @game_session = GameSession.find(100)
    @round = Round.new
    @round.game_session = @game_session
    @round.save
    @round_participation = RoundParticipation.new
    @wiki_pages = WikiPage.all.sort_by { |wiki_page| wiki_page.title }
  end
end
