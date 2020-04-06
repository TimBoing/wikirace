class GameSessionsQuickController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @unknown_user = User.find_by(username: "ModeSolo")
    @game_session = GameSession.find_by(user: @unknown_user)
    @round = Round.new
    @round.game_session = @game_session
    @round.save
    @round_participation = RoundParticipation.new
    @wiki_pages = WikiPage.all.sort_by { |wiki_page| wiki_page.title }
  end
end
