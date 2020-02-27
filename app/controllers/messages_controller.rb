class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @game_session = GameSession.find(params[:game_session_id])
    @message.game_session = @game_session
    @message.user = current_user
    if @message.save
      # here is the broadcast that happens when a message is saved
      ActionCable.server.broadcast("game_session_channel_#{@game_session.id}", {
        message_partial: render(partial: 'game_sessions/messages', locals: { message: @message })
      })

      respond_to do |format|
        format.html {redirect_to game_session_path(@game_session)}
        format.js
      end
    else
      respond_to do |format|
        format.html { render "game_session/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
