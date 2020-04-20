class AddLanguageToWikiPages < ActiveRecord::Migration[5.2]
  def change
    add_column :wiki_pages, :language, :string
  end
end
