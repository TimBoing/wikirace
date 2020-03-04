class RoundParticipationsController < ApplicationController
  before_action :find_round_and_game_session

  def new
    @round_participation = RoundParticipation.new
    @creator = User.find(@game_session.user_id)
  end

  def create
    @round_participation = current_user.round_participations.new(round_id: @round.id)
    @round_participation.save
    redirect_to game_session_path(@game_session)
  end

  def index
    @round_participation = RoundParticipation.where(user: current_user)[0]
    @round_participations = @round.round_participations
    @round_participation = @round.round_participations.select {|round_participation| round_participation.user == current_user}[0]
    if @round_participation.is_the_best?
      @round_participation.save_record(current_user)
    end
    # @round_participations.each{ |round_participation|
    #   round_participation.rank = round_participation.rank_for_round
    #   round_participation.score = round_participation.score_for_round
    #   round_participation.save
    # }
    @sorted_round_participations = @round_participations.sort_by{ |round_participation| round_participation.rank}
    @players = @round_participations.map { |round_participation| round_participation.user }
  end

  def edit
  end

  def update
  end

  private

  def find_round_and_game_session
    @round = Round.find(params[:round_id])
    @game_session = GameSession.find(@round.game_session_id)
  end
end

