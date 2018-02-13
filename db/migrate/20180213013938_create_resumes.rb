class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.references :user
      t.timestamps
    end
  end
end
