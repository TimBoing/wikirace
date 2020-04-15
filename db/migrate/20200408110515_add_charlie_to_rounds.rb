class AddCharlieToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :charlie, :boolean, default: false
  end
end
