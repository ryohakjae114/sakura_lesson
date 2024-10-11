class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :lesson_date

  validates :user_id, uniqueness: { scope: :lesson_date_id }
end
