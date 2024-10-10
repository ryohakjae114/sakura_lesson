require 'rails_helper'

RSpec.describe 'Admins::Lessons::LessonDates', type: :system do
  let!(:hakjae) { create(:admin) }
  let!(:lesson) { create(:lesson, title: 'カヤック', instructor: '阿久津') }

  before do
    sign_in hakjae
  end

  it 'レッスン日時を一覧できること' do
    create(:lesson_date, date: '2025-10-10', start_time: '12:00:00', end_time: '15:00:00', capacity: 50, url: 'https://example.com/example', lesson:)
    visit admins_root_path
    within(".test_#{lesson.id}") do
      click_on 'レッスン日時一覧'
    end
    expect(page).to have_content '2025-10-10'
    expect(page).to have_content '12:00'
    expect(page).to have_content '15:00'
    expect(page).to have_content '50'
    expect(page).to have_content 'https://example.com/example'
  end
end
