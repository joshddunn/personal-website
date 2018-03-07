class AddScreenshotIdentifier < ActiveRecord::Migration[5.1]
  def change
    add_column :screenshots, :hex, :string, index: true
  end
end
