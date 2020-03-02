class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    @created_game_sessions_clean = []
    @created_game_sessions = current_user.game_sessions
    @created_game_sessions.each { |game_session|
      if game_session.rounds.count != 0
        @created_game_sessions_clean << game_session
      end
    }
    @game_sessions_played = current_user.round_participations.map { |round_participation|
      round_participation.round.game_session
    }.uniq
    @records_perso = current_user.round_participations.uniq { |round_participation| [round_participation.round.start_page, round_participation.round.end_page] }
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :photo)
  end

  def set_user
    @user = current_user
  end
end
