class SurveyQuestion < ApplicationRecord
  belongs_to :lesson

  has_many :survey_answers, dependent: :destroy

  validates :content, presence: true, length: { maximum: 255 }
end
