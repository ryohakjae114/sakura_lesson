require 'rails_helper'

RSpec.describe 'Lessons::LessonDates', type: :system do
  let!(:lesson) { create(:lesson, title: 'カヤック', instructor: '阿久津', published: true) }

  it 'レッスン開催日を一覧できること' do
    create(:lesson_date, start_at: '2024/10/17 12:00', end_at: '2024/10/17 15:00', lesson:)
    create(:lesson_date, start_at: '2024/10/17 18:00', end_at: '2024/10/17 19:00', lesson:)
    visit lesson_path(lesson)
    click_on 'このレッスンの開催日時を確認する'
    expect(page).to have_content 'レッスン開催日一覧'
    expect(page).to have_content '2024/10/17 12:00'
    expect(page).to have_content '2024/10/17 18:00'
  end
end
