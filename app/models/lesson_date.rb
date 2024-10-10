class LessonDate < ApplicationRecord
  belongs_to :lesson

  validates :date, presence: true, uniqueness: { scope: :lesson_id }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :url, presence: true, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
end
