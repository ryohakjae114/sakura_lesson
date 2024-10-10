require 'rails_helper'

RSpec.describe LessonDate, type: :model do
  it '同じレッスンと同じ開始日のレッスン日は作成できないこと' do
    lesson = create(:lesson)
    tomorrow = Time.zone.tomorrow
    create(:lesson_date, date: tomorrow, lesson:)
    lesson_date = build(:lesson_date, date: tomorrow, lesson:)
    lesson_date.valid?
    expect(lesson_date.errors[:date]).to include('はすでに存在します')
  end
end
