require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let!(:lesson) { create(:lesson) }
  let!(:hakjae) { create(:user) }
  let!(:started_lesson_date) { create(:lesson_date, :skip_validation, start_at: '2023/10/10 10:00', end_at: '2023/10/10 11:00', lesson:) }
  let!(:not_started_lesson_date) { create(:lesson_date, start_at: '2024/10/18 10:00', end_at: '2024/10/18 12:00', lesson:) }

  it '現在の時間よりも前のレッスンの予約は登録できない' do
    reservation = build(:reservation, user: hakjae, lesson_date: not_started_lesson_date)
    expect(reservation).to be_valid

    reservation = build(:reservation, user: hakjae, lesson_date: started_lesson_date)
    expect(reservation).not_to be_valid
  end
end
