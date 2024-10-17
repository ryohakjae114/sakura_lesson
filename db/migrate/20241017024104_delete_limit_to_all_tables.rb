class DeleteLimitToAllTables < ActiveRecord::Migration[7.2]
  def change
    change_column(:survey_answers, :content, :string, limit: false)
    change_column(:survey_questions, :content, :string, limit: false)
    change_column(:lessons, :instructor, :string, limit: false)
    change_column(:lessons, :title, :string, limit: false)
    change_column(:users, :name, :string, limit: false)
  end
end
