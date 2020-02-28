class CreatePaths < ActiveRecord::Migration[5.2]
  def change
    create_table :paths do |t|
      t.references :user, foreign_key: true
      t.references :duration
      t.references :start_page
      t.references :end_page

      t.timestamps
    end
  end
end