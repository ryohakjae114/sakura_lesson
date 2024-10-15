class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :lesson_date, counter_cache: true

  validates :user_id, uniqueness: { scope: :lesson_date_id }
end
