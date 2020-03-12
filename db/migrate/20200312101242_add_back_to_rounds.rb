class AddBackToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :back, :boolean, default: true
  end
end
