class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, index: { unique: true }
      t.text :content
      t.text :markdown
      t.date :published, index: true

      t.timestamps
    end
  end
end
