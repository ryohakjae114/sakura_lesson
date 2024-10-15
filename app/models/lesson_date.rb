class LessonDate < ApplicationRecord
  belongs_to :lesson

  has_many :reservations, dependent: :destroy

  validates :start_at, presence: true,
                       comparison: { greater_than_or_equal_to: Time.zone.now, message: I18n.t('activerecord.errors.models.lesson_dates.must_greater_than_now') }
  validates :end_at, presence: true,
                     comparison: { greater_than: :start_at, message: I18n.t('activerecord.errors.models.lesson_dates.must_greater_than_start_at') }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :url, presence: true, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
  validate :cannot_start_time_and_end_at_overlap

  def cannot_start_time_and_end_at_overlap
    overlapping_lesson_dates = lesson.lesson_dates.where(start_at: start_at...end_at)
                                     .or(lesson.lesson_dates.where(end_at: start_at...end_at))
                                     .or(lesson.lesson_dates.where(start_at: ..start_at,
                                                                   end_at: end_at..))
    overlapping_lesson_dates.delete(self)
    if overlapping_lesson_dates.present?
      errors.add(:start_at, I18n.t('activerecord.errors.models.lesson_dates.cannot_start_time_and_end_at_overlap'))
    end
  end
end
