class SurveyAnswer < ApplicationRecord
  belongs_to :survey_question
  belongs_to :user

  validates :survey_question_id, uniqueness: { scope: :user }
  validates :content, presence: true, length: { maximum: 255 }
end
