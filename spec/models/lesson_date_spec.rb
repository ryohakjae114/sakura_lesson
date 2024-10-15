require 'rails_helper'

RSpec.describe LessonDate, type: :model do
  let(:lesson) { create(:lesson) }

  before do
    create(:lesson_date, start_at: '2024-10-17-12:00:00', end_at: '2024-10-17-13:00:00', capacity: 50, lesson:)
  end

  it '他の開催日と開始時間と終了時間が被ってはいけない' do
    lesson_date = build(:lesson_date, start_at: '2024-10-17-11:00:00', end_at: '2024-10-17-12:00:00', lesson:)
    expect(lesson_date).to be_valid
    lesson_date = build(:lesson_date, start_at: '2024-10-17-11:00:00', end_at: '2024-10-17-12:01:00', lesson:)
    expect(lesson_date).not_to be_valid

    lesson_date = build(:lesson_date, start_at: '2024-10-17-12:59:00', end_at: '2024-10-17-14:00:00', lesson:)
    expect(lesson_date).not_to be_valid
    lesson_date = build(:lesson_date, start_at: '2024-10-17-13:00:00', end_at: '2024-10-17-14:00:00', lesson:)
    expect(lesson_date).to be_valid

    lesson_date = build(:lesson_date, start_at: '2024-10-17-12:00:00', end_at: '2024-10-17-13:00:00', lesson:)
    expect(lesson_date).not_to be_valid

    lesson_date = build(:lesson_date, start_at: '2024-10-17-12:01:00', end_at: '2024-10-17-11:59:00', lesson:)
    expect(lesson_date).not_to be_valid
  end
end
