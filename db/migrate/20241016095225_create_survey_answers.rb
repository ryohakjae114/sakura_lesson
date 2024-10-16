class CreateSurveyAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :survey_answers do |t|
      t.references :survey_question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :content, limit: 255, null: false, default: ''

      t.timestamps
    end
    add_index :survey_answers, %i[survey_question_id user_id], unique: true
  end
end
