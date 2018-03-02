class AddScreenshotAttachment < ActiveRecord::Migration[5.1]
  def up
    add_attachment :screenshots, :image
  end
  def down
    remove_attachment :screenshots, :image
  end
end
