class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :lesson_date, counter_cache: true

  validates :user_id, uniqueness: { scope: :lesson_date_id }
  validate :reservation_counts_must_be_within_capacity

  def reservation_counts_must_be_within_capacity
    errors.add(:base, 'reservation_counts_must_be_within_capacity') if lesson_date.reservations_count >= lesson_date.capacity
  end
end
