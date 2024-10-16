class SurveyQuestion < ApplicationRecord
  belongs_to :lesson

  validates :content, presence: true, length: { maximum: 255 }
end
