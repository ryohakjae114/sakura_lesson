class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :lesson_date, counter_cache: true

  has_one :lesson, through: :lesson_date

  validates :user_id, uniqueness: { scope: :lesson_date_id }
  validate :reservation_counts_must_be_within_capacity
  validate :cannot_reserve_already_started_lesson

  def reservation_counts_must_be_within_capacity
    errors.add(:base, 'reservation_counts_must_be_within_capacity') if lesson_date.reservations_count >= lesson_date.capacity
  end

  def cannot_reserve_already_started_lesson
    errors.add(:base, 'cannot_reserve_already_started_lesson') if lesson_date.start_at < Time.zone.now
  end
end
