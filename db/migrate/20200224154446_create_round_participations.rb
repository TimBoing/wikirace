class CreateRoundParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :round_participations do |t|
      t.references :user, foreign_key: true
      t.references :round, foreign_key: true
      t.integer :score, default: 0
      t.integer :rank
      t.time :end_time

      t.timestamps
    end
  end
end
