class SurveyAnswer < ApplicationRecord
  belongs_to :survery_question
  belongs_to :user
end
