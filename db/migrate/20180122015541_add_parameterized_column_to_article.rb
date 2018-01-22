class AddParameterizedColumnToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :parameterized, :string
    add_index :articles, :parameterized, unique: true
  end
end
