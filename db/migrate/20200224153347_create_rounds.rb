class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.string :start_page
      t.string :end_page
      t.string :game_mode
      t.string :state
      t.string :start_time
      t.references :game_session, foreign_key: true

      t.timestamps
    end
  end
end
