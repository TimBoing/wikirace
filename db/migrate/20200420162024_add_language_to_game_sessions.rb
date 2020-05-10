class AddLanguageToGameSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :language, :string
  end
end
