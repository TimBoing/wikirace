class RoundParticipationsController < ApplicationController
  before_action :find_round_and_game_session

  def new
    @round_participation = RoundParticipation.new
    @creator = User.find(@game_session.user_id)
  end

  def create
    if params[:replay_round_id].nil?
      @round_participation = current_user.round_participations.new(round_id: @round.id)
    else
      @round_participation = current_user.round_participations.new(round_id: params[:replay_round_id])
    end
    @round_participation.save
    redirect_to game_session_path(@game_session)
  end

  def index
    @round_participations = @round.round_participations
    @round_participations.each{ |round_participation|
      round_participation.rank = round_participation.rank_for_round
      round_participation.score = round_participation.score_for_round
      round_participation.save
    }
    @round_participations = @round_participations.sort_by{ |round_participation| round_participation.rank}
    @players = @round_participations.map { |round_participation| round_participation.user }
    # Will be of use when we will want to end the Round not at the same time
    # ActionCable.server.broadcast("game_session_channel_#{@game_session.id}", player: current_user, round_participation: RoundParticipation.where(user_id: current_user.id, round_id: @round.id))
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

