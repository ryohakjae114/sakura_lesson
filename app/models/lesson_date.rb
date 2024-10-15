class LessonDate < ApplicationRecord
  belongs_to :lesson

  has_many :reservations, dependent: :destroy

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :url, presence: true, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
end
