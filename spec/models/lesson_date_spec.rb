require 'rails_helper'

RSpec.describe LessonDate, type: :model do
  let(:lesson) { create(:lesson) }
  let(:hakjae) { create(:user) }
  let(:songjae) { create(:user) }

  it '現在の時間よりも前のレッスンは登録できない' do
    lesson_date = build(:lesson_date, start_at: '2025-10-17-11:00:00', end_at: '2025-10-17-12:00:00', lesson:)
    expect(lesson_date).to be_valid
    lesson_date = build(:lesson_date, start_at: '2024-10-17-11:00:00', end_at: '2024-10-17-12:00:00', lesson:)
    expect(lesson_date).not_to be_valid
  end

  it '終了時間が開始時間より早いと登録できない' do
    lesson_date = build(:lesson_date, start_at: '2025-10-17-11:00:00', end_at: '2025-10-17-12:00:00', lesson:)
    expect(lesson_date).to be_valid
    lesson_date = build(:lesson_date, start_at: '2025-10-17-12:00:00', end_at: '2025-10-17-11:00:00', lesson:)
    expect(lesson_date).not_to be_valid
  end

  it '他の開催日と開始時間と終了時間が被ってはいけない' do
    create(:lesson_date, start_at: '2025-10-17-12:00:00', end_at: '2025-10-17-13:00:00', capacity: 1, lesson:)

    lesson_date = build(:lesson_date, start_at: '2025-10-17-11:00:00', end_at: '2025-10-17-12:01:00', lesson:)
    expect(lesson_date).not_to be_valid
    lesson_date = build(:lesson_date, start_at: '2025-10-17-11:00:00', end_at: '2025-10-17-12:00:00', lesson:)
    expect(lesson_date).to be_valid

    lesson_date = build(:lesson_date, start_at: '2025-10-17-12:59:00', end_at: '2025-10-17-14:00:00', lesson:)
    expect(lesson_date).not_to be_valid
    lesson_date = build(:lesson_date, start_at: '2025-10-17-13:00:00', end_at: '2025-10-17-14:00:00', lesson:)
    expect(lesson_date).to be_valid

    lesson_date = build(:lesson_date, start_at: '2025-10-17-12:00:00', end_at: '2025-10-17-13:00:00', lesson:)
    expect(lesson_date).not_to be_valid

    lesson_date = build(:lesson_date, start_at: '2025-10-17-12:01:00', end_at: '2025-10-17-11:59:00', lesson:)
    expect(lesson_date).not_to be_valid
  end

  it '予約数が定員の数だけいると予約できない' do
    lesson_date = build(:lesson_date, capacity: 1, start_at: '2025-10-17-11:00:00', end_at: '2025-10-17-12:00:00')
    reservation = build(:reservation, user: hakjae, lesson_date:)
    expect(reservation).to be_valid

    reservation.save

    reservation = build(:reservation, user: songjae, lesson_date:)
    expect(reservation).not_to be_valid
  end
end
