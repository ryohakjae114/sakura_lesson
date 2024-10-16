class CreateSurveyQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :survey_questions do |t|
      t.references :lesson, null: false, foreign_key: true
      t.string :content, limit: 255, null: false, default: ''

      t.timestamps
    end
  end
end
