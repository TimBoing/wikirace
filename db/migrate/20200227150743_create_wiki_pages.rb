class CreateWikiPages < ActiveRecord::Migration[5.2]
  def change
    create_table :wiki_pages do |t|
      t.string :title
      t.string :url
      t.text :categories

      t.timestamps
    end
  end
end
