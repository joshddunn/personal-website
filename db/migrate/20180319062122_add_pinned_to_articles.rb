class AddPinnedToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :pinned, :boolean, default: false
    add_index :articles, :pinned
  end
end
