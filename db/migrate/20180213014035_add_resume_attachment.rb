class AddResumeAttachment < ActiveRecord::Migration[5.1]
  def up
    add_attachment :resumes, :pdf
  end
  def down
    remove_attachment :resumes, :pdf
  end
end
