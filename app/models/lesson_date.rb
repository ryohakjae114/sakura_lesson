class LessonDate < ApplicationRecord
  belongs_to :lesson

  has_many :reservations, dependent: :destroy

  validates :start_at, presence: true,
                       comparison: { greater_than_or_equal_to: Time.zone.now, message: I18n.t('activerecord.errors.models.lesson_dates.must_greater_than_now') }
  validates :end_at, presence: true,
                     comparison: { greater_than: :start_at, message: I18n.t('activerecord.errors.models.lesson_dates.must_greater_than_start_at') }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :url, presence: true, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
end
