class RoundParticipationsController < ApplicationController
  def new
    @round_participation = RoundParticipation.new
    @round = Round.find(params[:round_id])
    @game_session = GameSession.find(@round.game_session_id)
    @creator = User.find(@game_session.user_id)
  end

  def create
    @round_participation = current_user.round_participations.new(round_participations_params)
    if params[:round_id]
      @round = Round.find(params[:round_id])
      @round_participation.round = @round
    else
      @round = Round.find(round_participations_params[:round_id])
    end
    @game_session = GameSession.find(@round.game_session_id)
    render 'game_sessions/show'

    # Attention lors de la creation de nouvelles instances de RoundParticipation,
    # on les sauve pas dans la DB... on les sauvera a la fin du jeu (Update)?
  end

  def edit
  end

  def update
  end

  private

  def round_participations_params
    if params[:round_participation] != nil
      params.require(:round_participation).permit(:round_id)
    end
  end
end
