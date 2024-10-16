class LessonDate < ApplicationRecord
  belongs_to :lesson

  has_many :reservations, dependent: :destroy
  has_many :reserved_users, through: :reservations, source: :user

  validates :start_at, presence: true,
                       comparison: { greater_than_or_equal_to: Time.zone.now, message: I18n.t('activerecord.errors.models.lesson_dates.must_greater_than_now') }
  validates :end_at, presence: true,
                     comparison: { greater_than: :start_at, message: I18n.t('activerecord.errors.models.lesson_dates.must_greater_than_start_at') }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :url, presence: true, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
  validate :cannot_start_at_and_end_at_overlap

  def cannot_start_at_and_end_at_overlap
    overlapping_lesson_dates = lesson.lesson_dates.where(start_at: start_at...end_at)
                                     .or(lesson.lesson_dates.where(end_at: start_at + 1.minute...end_at))
                                     .or(lesson.lesson_dates.where(start_at: ..start_at, end_at: end_at..))
                                     .merge(lesson.lesson_dates.where.not(id: self.id))
    if overlapping_lesson_dates.present?
      errors.add(:start_at, I18n.t('activerecord.errors.models.lesson_dates.cannot_start_at_and_end_at_overlap'))
    end
  end
end
