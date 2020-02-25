class GameSessionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_session_channel#{params[:game_session_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
