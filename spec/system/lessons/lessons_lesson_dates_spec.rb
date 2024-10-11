require 'rails_helper'

RSpec.describe 'Lessons::LessonDates', type: :system do
  let!(:lesson) { create(:lesson, title: 'カヤック', instructor: '阿久津', published: true) }

  it 'レッスン開催日を一覧できること' do
    create(:lesson_date, date: '2025-10-10', lesson:)
    create(:lesson_date, date: '2025-10-11', lesson:)
    visit lesson_path(lesson)
    click_on 'このレッスンの開催日時を確認する'
    expect(page).to have_content 'レッスン開催日一覧'
    expect(page).to have_content '2025-10-10'
    expect(page).to have_content '2025-10-11'
  end
end
